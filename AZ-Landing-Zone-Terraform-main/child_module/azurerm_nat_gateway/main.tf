variable "nat27" {}

resource "azurerm_nat_gateway" "nat" {
  for_each                = var.nat27
  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  sku_name                = each.value.sku_name
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
}
