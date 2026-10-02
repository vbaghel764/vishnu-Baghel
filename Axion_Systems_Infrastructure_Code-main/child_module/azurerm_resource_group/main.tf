variable "rgs07" {}

resource "azurerm_resource_group" "block_rg" {
    for_each = var.rgs07
    name = each.value.name
    location = each.value.location
}