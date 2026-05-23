resource "random_string" "storage_suffix" {
  length  = 8
  special = false
  upper   = false
  numeric = true
}

resource "azurerm_storage_account" "unity_catalog" {
  name                     = "stdbwuc${random_string.storage_suffix.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true # Essential for ADLS Gen2 / hierarchical namespace
  tags                     = var.tags
}

resource "azurerm_storage_container" "metastore" {
  name                  = "unity-catalog-metastore"
  storage_account_name  = azurerm_storage_account.unity_catalog.name
  container_access_type = "private"
}
