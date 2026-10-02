variable "vnet07" {}

resource "azurerm_virtual_network" "block_vnet" {
  for_each = var.vnet07
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space = each.value.address_space
}