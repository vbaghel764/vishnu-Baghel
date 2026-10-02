variable "rg27" {}

resource "azurerm_resource_group" "rg_block" {
  for_each = var.rg27
  name     = each.value.name
  location = each.value.location
}