variable "vnet27" {}

resource "azurerm_virtual_network" "vnet_block" {
  for_each            = var.vnet27
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}