variable "nsg27" {}

resource "azurerm_network_security_group" "nsg_block" {
  for_each            = var.nsg27
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}
