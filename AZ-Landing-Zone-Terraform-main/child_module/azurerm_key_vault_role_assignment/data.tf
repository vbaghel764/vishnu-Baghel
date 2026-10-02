data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "keyvault" {
  for_each            = var.keyvaultrole27
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}
