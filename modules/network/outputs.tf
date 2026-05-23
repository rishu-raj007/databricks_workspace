output "vnet_id" {
  value       = azurerm_virtual_network.this.id
  description = "The ID of the Virtual Network."
}

output "vnet_name" {
  value       = azurerm_virtual_network.this.name
  description = "The name of the Virtual Network."
}

output "public_subnet_id" {
  value       = azurerm_subnet.public.id
  description = "The ID of the public node subnet."
}

output "public_subnet_name" {
  value       = azurerm_subnet.public.name
  description = "The name of the public node subnet."
}

output "private_subnet_id" {
  value       = azurerm_subnet.private.id
  description = "The ID of the private container subnet."
}

output "private_subnet_name" {
  value       = azurerm_subnet.private.name
  description = "The name of the private container subnet."
}
