variable "nsgaso27" {}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each                  = var.nsgaso27
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}
