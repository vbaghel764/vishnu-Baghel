data "azurerm_nat_gateway" "nat_gateway" {
  for_each            = var.natpipaso27
  name                = each.value.nat_gateway_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_public_ip" "public_ip" {
  for_each            = var.natpipaso27
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}
