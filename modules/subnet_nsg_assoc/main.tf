resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = var.public_subnet_id
  network_security_group_id = var.public_nsg_id
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = var.private_subnet_id
  network_security_group_id = var.private_nsg_id
}
