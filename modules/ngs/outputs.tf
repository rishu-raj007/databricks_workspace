output "public_nsg_id" {
  value       = azurerm_network_security_group.public.id
  description = "The ID of the public subnet NSG."
}

output "private_nsg_id" {
  value       = azurerm_network_security_group.private.id
  description = "The ID of the private subnet NSG."
}
