variable "pip07" {}

resource "azurerm_public_ip" "block_pip" {
    for_each = var.pip07
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}