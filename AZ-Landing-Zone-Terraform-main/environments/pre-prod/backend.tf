terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "sttfstatekeshav27"
    container_name       = "tfstate"
    key                  = "pre-prod.terraform.tfstate"
    use_azuread_auth     = true
  }
}
