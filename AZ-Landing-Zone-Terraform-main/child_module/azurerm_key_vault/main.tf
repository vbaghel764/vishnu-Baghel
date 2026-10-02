variable "keyvault27" {}

resource "azurerm_key_vault" "keyvault" {
  for_each                      = var.keyvault27
  name                          = each.value.name
  location                      = each.value.location
  resource_group_name           = each.value.resource_group_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = each.value.sku_name
  purge_protection_enabled      = each.value.purge_protection_enabled
  soft_delete_retention_days    = each.value.soft_delete_retention_days
  public_network_access_enabled = each.value.public_network_access_enabled
  rbac_authorization_enabled    = each.value.rbac_authorization_enabled
}
