data "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "keyvault" {
  for_each            = var.vms
  name                = each.value.key_vault_name
  resource_group_name = each.value.key_vault_resource_group_name
}

data "azurerm_key_vault_secret" "admin_username" {
  for_each     = var.vms
  name         = each.value.username_secret_name
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}

data "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.vms
  name         = each.value.password_secret_name
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}
