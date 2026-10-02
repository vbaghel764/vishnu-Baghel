variable "keyvaultrole27" {}

resource "azurerm_role_assignment" "keyvault_role" {
  for_each             = var.keyvaultrole27
  scope                = data.azurerm_key_vault.keyvault[each.key].id
  role_definition_name = each.value.role_definition_name
  principal_id         = data.azurerm_client_config.current.object_id
}
