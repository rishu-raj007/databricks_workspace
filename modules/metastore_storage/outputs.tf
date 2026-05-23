output "storage_account_id" {
  value       = azurerm_storage_account.unity_catalog.id
  description = "The ID of the ADLS Gen2 Storage Account."
}

output "storage_account_name" {
  value       = azurerm_storage_account.unity_catalog.name
  description = "The name of the ADLS Gen2 Storage Account."
}

output "storage_container_name" {
  value       = azurerm_storage_container.metastore.name
  description = "The name of the Metastore container."
}

output "storage_container_url" {
  value       = "abfss://${azurerm_storage_container.metastore.name}@${azurerm_storage_account.unity_catalog.name}.dfs.core.windows.net/"
  description = "The ABFSS endpoint path to the Metastore container to be used when creating your Unity Catalog Metastore."
}
