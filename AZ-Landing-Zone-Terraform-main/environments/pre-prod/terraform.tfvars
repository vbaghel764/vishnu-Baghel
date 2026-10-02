rg27 = {
  rg1 = {
    name     = "rg-preprod"
    location = "Central India"
  }
  rg2 = {
    name     = "rg-humana"
    location = "Central India"
  }
}

vnet27 = {
  vnet1 = {
    name                = "vnet-preprod"
    location            = "Central India"
    resource_group_name = "rg-preprod"
    address_space       = ["10.0.0.0/16"]
  }
}

snet27 = {
  snet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "vnet-preprod"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "vnet-preprod"
    address_prefixes     = ["10.0.2.0/24"]
  }

  snet3 = {
    name                 = "database-subnet"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "vnet-preprod"
    address_prefixes     = ["10.0.3.0/24"]
  }

  snet4 = {
    name                 = "AppGatewaySubnet"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "vnet-preprod"
    address_prefixes     = ["10.0.0.64/26"]
  }

  snet5 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "vnet-preprod"
    address_prefixes     = ["10.0.0.0/26"]
  }
}

nsg27 = {
  nsg1 = {
    name                = "frontend-nsg"
    location            = "Central India"
    resource_group_name = "rg-preprod"
  }
  nsg2 = {
    name                = "backend-nsg"
    location            = "Central India"
    resource_group_name = "rg-preprod"
  }
  nsg3 = {
    name                = "database-nsg"
    location            = "Central India"
    resource_group_name = "rg-preprod"
  }
}

nsgaso27 = {
  nsgaso1 = {
    subnet_name          = "frontend-subnet"
    virtual_network_name = "vnet-preprod"
    resource_group_name  = "rg-preprod"
    nsg_name             = "frontend-nsg"
  }
  nsgaso2 = {
    subnet_name          = "backend-subnet"
    virtual_network_name = "vnet-preprod"
    resource_group_name  = "rg-preprod"
    nsg_name             = "backend-nsg"
  }

  nsgaso3 = {
    subnet_name          = "database-subnet"
    virtual_network_name = "vnet-preprod"
    resource_group_name  = "rg-preprod"
    nsg_name             = "database-nsg"
  }
}

pip27 = {
  pip1 = {
    name                = "bastion-pip"
    location            = "Central India"
    resource_group_name = "rg-preprod"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    name                = "appgw-pip"
    location            = "Central India"
    resource_group_name = "rg-preprod"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip3 = {
    name                = "nat-pip"
    location            = "Central India"
    resource_group_name = "rg-preprod"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nat27 = {
  nat1 = {
    name                    = "natgw-preprod"
    location                = "Central India"
    resource_group_name     = "rg-preprod"
    sku_name                = "Standard"
    idle_timeout_in_minutes = 10
  }
}

natpipaso27 = {
  nat1 = {
    nat_gateway_name    = "natgw-preprod"
    public_ip_name      = "nat-pip"
    resource_group_name = "rg-preprod"
  }
}

natsub27 = {
  natsub1 = {
    subnet_name          = "frontend-subnet"
    virtual_network_name = "vnet-preprod"
    resource_group_name  = "rg-preprod"
    nat_gateway_name     = "natgw-preprod"
  }
  natsub2 = {
    subnet_name          = "backend-subnet"
    virtual_network_name = "vnet-preprod"
    resource_group_name  = "rg-preprod"
    nat_gateway_name     = "natgw-preprod"
  }
  natsub3 = {
    subnet_name          = "database-subnet"
    virtual_network_name = "vnet-preprod"
    resource_group_name  = "rg-preprod"
    nat_gateway_name     = "natgw-preprod"
  }
}

bastion27 = {
  bastion1 = {
    name                  = "bastion-preprod"
    location              = "Central India"
    resource_group_name   = "rg-preprod"
    subnet_name           = "AzureBastionSubnet"
    virtual_network_name  = "vnet-preprod"
    public_ip_name        = "bastion-pip"
    ip_configuration_name = "bastion-ipconfig"
  }
}

appgw27 = {
  appgw1 = {
    name                 = "appgw-preprod"
    location             = "Central India"
    resource_group_name  = "rg-preprod"
    subnet_name          = "AppGatewaySubnet"
    virtual_network_name = "vnet-preprod"
    public_ip_name       = "appgw-pip"

    sku_name                      = "Standard_v2"
    sku_tier                      = "Standard_v2"
    capacity                      = 2
    gateway_ip_configuration_name = "appgw-ipconfig"

    frontend_port_name = "http-port"
    frontend_port      = 80

    frontend_ip_configuration_name = "frontend-ip"

    backend_address_pool_name = "backend-pool"

    backend_http_settings_name = "backend-http-setting"
    backend_port               = 80

    http_listener_name = "http-listener"

    request_routing_rule_name = "rule1"
    priority                  = 100
  }
}

nic27 = {
  nic1 = {
    name                          = "frontend-nic"
    location                      = "Central India"
    resource_group_name           = "rg-preprod"
    subnet_name                   = "frontend-subnet"
    virtual_network_name          = "vnet-preprod"
    ip_configuration_name         = "frontend-ipconfig"
    private_ip_address_allocation = "Dynamic"
  }
  nic2 = {
    name                          = "backend-nic"
    location                      = "Central India"
    resource_group_name           = "rg-preprod"
    subnet_name                   = "backend-subnet"
    virtual_network_name          = "vnet-preprod"
    ip_configuration_name         = "backend-ipconfig"
    private_ip_address_allocation = "Dynamic"
  }
  nic3 = {
    name                          = "database-nic"
    location                      = "Central India"
    resource_group_name           = "rg-preprod"
    subnet_name                   = "database-subnet"
    virtual_network_name          = "vnet-preprod"
    ip_configuration_name         = "database-ipconfig"
    private_ip_address_allocation = "Dynamic"
  }
}

vms = {
  vm1 = {
    name                          = "frontend-vm"
    location                      = "Central India"
    resource_group_name           = "rg-preprod"
    size                          = "Standard_D2ls_v5"
    network_interface_name        = "frontend-nic"
    key_vault_name                = "key-vault-27"
    key_vault_resource_group_name = "rg-preprod"
    username_secret_name          = "frontend-admin-username"
    password_secret_name          = "frontend-admin-password"
  }

  vm2 = {
    name                          = "backend-vm"
    location                      = "Central India"
    resource_group_name           = "rg-preprod"
    size                          = "Standard_D2ls_v5"
    network_interface_name        = "backend-nic"
    key_vault_name                = "key-vault-27"
    key_vault_resource_group_name = "rg-preprod"
    username_secret_name          = "backend-admin-username"
    password_secret_name          = "backend-admin-password"
  }
}

keyvault27 = {
  kv1 = {
    name                          = "key-vault-27"
    location                      = "Central India"
    resource_group_name           = "rg-preprod"
    sku_name                      = "standard"
    purge_protection_enabled      = false
    soft_delete_retention_days    = 7
    public_network_access_enabled = true
    rbac_authorization_enabled    = true
  }
}

keyvaultsecret27 = {
  frontend_username = {
    name                = "frontend-admin-username"
    value               = "azureuser"
    key_vault_name      = "key-vault-27"
    resource_group_name = "rg-preprod"
    content_type        = "Frontend VM Administrator Username"
  }

  frontend_password = {
    name                = "frontend-admin-password"
    value               = "P@ssw0rd@123"
    key_vault_name      = "key-vault-27"
    resource_group_name = "rg-preprod"
    content_type        = "Frontend VM Administrator Password"
  }

  backend_username = {
    name                = "backend-admin-username"
    value               = "azureuser"
    key_vault_name      = "key-vault-27"
    resource_group_name = "rg-preprod"
    content_type        = "Backend VM Administrator Username"
  }

  backend_password = {
    name                = "backend-admin-password"
    value               = "P@ssw0rd@123"
    key_vault_name      = "key-vault-27"
    resource_group_name = "rg-preprod"
    content_type        = "Backend VM Administrator Password"
  }
}

keyvaultrole27 = {
  secrets_officer = {
    key_vault_name       = "key-vault-27"
    resource_group_name  = "rg-preprod"
    role_definition_name = "Key Vault Secrets Officer"
  }
}