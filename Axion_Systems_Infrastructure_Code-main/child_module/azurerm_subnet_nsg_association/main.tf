variable "asso07" {}

resource "azurerm_subnet_network_security_group_association" "block_asso" {
  for_each                  = var.asso07
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}
