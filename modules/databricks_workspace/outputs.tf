output "workspace_id" {
  value       = azurerm_databricks_workspace.workspace.id
  description = "The unique ID of the Azure Databricks workspace."
}

output "workspace_url" {
  value       = azurerm_databricks_workspace.workspace.workspace_url
  description = "The direct URL to access the Databricks workspace web UI."
}

output "workspace_managed_resource_group_id" {
  value       = azurerm_databricks_workspace.workspace.managed_resource_group_id
  description = "The resource group ID of the Databricks-managed resource group."
}

output "access_connector_id" {
  value       = azurerm_databricks_access_connector.connector.id
  description = "The ID of the Azure Databricks Access Connector for Unity Catalog."
}

output "access_connector_principal_id" {
  value       = azurerm_databricks_access_connector.connector.identity[0].principal_id
  description = "The system-assigned Principal ID of the Access Connector's Managed Identity (used for Unity Catalog)."
}
