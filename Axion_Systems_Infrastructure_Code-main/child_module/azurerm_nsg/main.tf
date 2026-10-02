variable "nsg07" {}

resource "azurerm_network_security_group" "block_nsg" {
    for_each = var.nsg07
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_security_rule" "allow_ssh" {
  for_each = var.nsg07
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name         = each.value.resource_group_name
  network_security_group_name = azurerm_network_security_group.block_nsg[each.key].name
}