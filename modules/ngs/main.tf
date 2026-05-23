resource "azurerm_network_security_group" "public" {
  name                = "${var.prefix}-public-nsg"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_network_security_group" "private" {
  name                = "${var.prefix}-private-nsg"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}
