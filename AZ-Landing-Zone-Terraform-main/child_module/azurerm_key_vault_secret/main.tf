variable "keyvaultsecret27" {}

resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.keyvaultsecret27
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
  content_type = each.value.content_type
}
