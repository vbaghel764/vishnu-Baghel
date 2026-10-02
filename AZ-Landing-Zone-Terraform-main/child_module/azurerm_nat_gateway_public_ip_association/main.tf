variable "natpipaso27" {}

resource "azurerm_nat_gateway_public_ip_association" "nat_pip_association" {
  for_each             = var.natpipaso27
  nat_gateway_id       = data.azurerm_nat_gateway.nat_gateway[each.key].id
  public_ip_address_id = data.azurerm_public_ip.public_ip[each.key].id
}
