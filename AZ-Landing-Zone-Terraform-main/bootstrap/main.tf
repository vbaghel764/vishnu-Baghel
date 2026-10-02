resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups
  name     = each.value.name
  location = each.value.location
}

resource "azurerm_storage_account" "sa" {
  for_each = var.storage_accounts

  name                            = each.value.name
  resource_group_name             = azurerm_resource_group.rg[each.key].name
  location                        = azurerm_resource_group.rg[each.key].location
  account_tier                    = each.value.account_tier
  account_replication_type        = each.value.account_replication_type
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "container" {
  for_each              = var.containers
  name                  = each.value.name
  storage_account_id    = azurerm_storage_account.sa["backend"].id
  container_access_type = each.value.access_type
}
