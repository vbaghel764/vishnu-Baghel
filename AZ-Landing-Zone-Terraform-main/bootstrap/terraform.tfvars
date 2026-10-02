resource_groups = {
  backend = {
    name     = "rg-terraform-backend"
    location = "Central India"
  }
}

storage_accounts = {
  backend = {
    name                     = "sttfstatekeshav27"
    resource_group_name      = "rg-terraform-backend"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

containers = {
  tfstate = {
    name                 = "tfstate"
    storage_account_name = "sttfstatekeshav27"
    access_type          = "private"
  }
}