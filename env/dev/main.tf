# Resource Group for the Dev environment
resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags     = var.tags
}

# 1. Network Module (Iterated)
module "network" {
  for_each = var.workspaces
  source   = "../../modules/network"

  prefix              = "${var.prefix}-${each.key}"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  vnet_cidr           = each.value.vnet_cidr
  public_subnet_cidr  = each.value.public_subnet_cidr
  private_subnet_cidr = each.value.private_subnet_cidr
  tags                = var.tags
}

# 2. Network Security Groups Module (Iterated)
module "ngs" {
  for_each = var.workspaces
  source   = "../../modules/ngs"

  prefix              = "${var.prefix}-${each.key}"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  tags                = var.tags
}

# 3. Subnet-NSG Association Module (Iterated)
module "subnet_nsg_assoc" {
  for_each = var.workspaces
  source   = "../../modules/subnet_nsg_assoc"

  public_subnet_id  = module.network[each.key].public_subnet_id
  public_nsg_id     = module.ngs[each.key].public_nsg_id
  private_subnet_id = module.network[each.key].private_subnet_id
  private_nsg_id    = module.ngs[each.key].private_nsg_id
}

# 4. Databricks Workspace Module (Iterated)
module "databricks_workspace" {
  for_each = var.workspaces
  source   = "../../modules/databricks_workspace"

  prefix              = "${var.prefix}-${each.key}"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  sku                 = each.value.sku
  vnet_id             = module.network[each.key].vnet_id
  public_subnet_name  = module.network[each.key].public_subnet_name
  private_subnet_name = module.network[each.key].private_subnet_name

  public_subnet_nsg_association_id  = module.subnet_nsg_assoc[each.key].public_assoc_id
  private_subnet_nsg_association_id = module.subnet_nsg_assoc[each.key].private_assoc_id

  tags = var.tags
}

# 5. Metastore Storage Module (Iterated)
module "metastore_storage" {
  for_each = var.workspaces
  source   = "../../modules/metastore_storage"

  prefix              = "${var.prefix}-${each.key}"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  tags                = var.tags
}

# 6. Role Assignment Module (Iterated)
module "role_assignment" {
  for_each = var.workspaces
  source   = "../../modules/role_assignment"

  scope        = module.metastore_storage[each.key].storage_account_id
  principal_id = module.databricks_workspace[each.key].access_connector_principal_id
}

# --- Environment Level Outputs ---

output "resource_group_name" {
  value       = azurerm_resource_group.this.name
  description = "The name of the Resource Group created for the environment."
}

output "workspace_ids" {
  value       = { for k, v in module.databricks_workspace : k => v.workspace_id }
  description = "A map of unique IDs of the Azure Databricks workspaces."
}

output "workspace_urls" {
  value       = { for k, v in module.databricks_workspace : k => v.workspace_url }
  description = "A map of URLs to access the Databricks workspaces Web UI."
}

output "workspace_managed_resource_group_ids" {
  value       = { for k, v in module.databricks_workspace : k => v.workspace_managed_resource_group_id }
  description = "A map of resource group IDs of the Databricks-managed resource groups."
}

output "access_connector_identity_principal_ids" {
  value       = { for k, v in module.databricks_workspace : k => v.access_connector_principal_id }
  description = "A map of system-assigned Principal IDs of the Access Connector's Managed Identities (used for Unity Catalog)."
}

output "storage_account_names" {
  value       = { for k, v in module.metastore_storage : k => v.storage_account_name }
  description = "A map of the names of the ADLS Gen2 Storage Accounts."
}

output "storage_container_urls" {
  value       = { for k, v in module.metastore_storage : k => v.storage_container_url }
  description = "A map of ABFSS endpoint paths to the Metastore containers to be used when creating your Unity Catalog Metastores."
}
