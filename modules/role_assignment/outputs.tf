output "role_assignment_id" {
  value       = azurerm_role_assignment.unity_catalog_access.id
  description = "The ID of the Azure Role Assignment."
}
