output "public_assoc_id" {
  value       = azurerm_subnet_network_security_group_association.public.id
  description = "The ID of the public subnet association."
}

output "private_assoc_id" {
  value       = azurerm_subnet_network_security_group_association.private.id
  description = "The ID of the private subnet association."
}
