variable "snet07" {}

resource "azurerm_subnet" "block_snet" {
  for_each = var.snet07
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes = each.value.address_prefixes
}