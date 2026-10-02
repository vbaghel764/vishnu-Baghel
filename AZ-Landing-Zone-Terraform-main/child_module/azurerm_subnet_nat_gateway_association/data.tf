data "azurerm_subnet" "subnet" {
  for_each             = var.natsub27
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_nat_gateway" "nat_gateway" {
  for_each            = var.natsub27
  name                = each.value.nat_gateway_name
  resource_group_name = each.value.resource_group_name
}
