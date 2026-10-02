variable "natsub27" {}

resource "azurerm_subnet_nat_gateway_association" "nat_gateway_association" {
  for_each       = var.natsub27
  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  nat_gateway_id = data.azurerm_nat_gateway.nat_gateway[each.key].id
}
