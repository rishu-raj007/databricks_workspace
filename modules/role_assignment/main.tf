resource "azurerm_role_assignment" "unity_catalog_access" {
  scope                = var.scope
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.principal_id
}
