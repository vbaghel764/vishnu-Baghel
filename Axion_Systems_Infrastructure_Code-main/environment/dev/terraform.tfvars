rgs07 = {
  rg1 = {
    name     = "rg-axion-dev-001"
    location = "centralindia"
  }
}

vnet07 = {
  vnet1 = {
    name                = "vnet-axion-dev-001"
    resource_group_name = "rg-axion-dev-001"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }
}

snet07 = {
  snet1 = {
    name                 = "Frontend-Subnet"
    resource_group_name  = "rg-axion-dev-001"
    virtual_network_name = "vnet-axion-dev-001"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "Backend-Subnet"
    resource_group_name  = "rg-axion-dev-001"
    virtual_network_name = "vnet-axion-dev-001"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet3 = {
    name                 = "Database-Subnet"
    resource_group_name  = "rg-axion-dev-001"
    virtual_network_name = "vnet-axion-dev-001"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

nsg07 = {
  nsg1 = {
    name                = "Frontend-nsg"
    location            = "centralindia"
    resource_group_name = "rg-axion-dev-001"
  }
  nsg2 = {
    name                = "Backend-nsg"
    location            = "centralindia"
    resource_group_name = "rg-axion-dev-001"
  }
  nsg3 = {
    name                = "Database-nsg"
    location            = "centralindia"
    resource_group_name = "rg-axion-dev-001"
  }
}

asso07 = {
  asso1 = {
    subnet_name          = "Frontend-Subnet"
    virtual_network_name = "vnet-axion-dev-001"
    resource_group_name  = "rg-axion-dev-001"
    nsg_name             = "Frontend-nsg"
  }
  asso2 = {
    subnet_name          = "Backend-Subnet"
    virtual_network_name = "vnet-axion-dev-001"
    resource_group_name  = "rg-axion-dev-001"
    nsg_name             = "Backend-nsg"
  }
  asso3 = {
    subnet_name          = "Database-Subnet"
    virtual_network_name = "vnet-axion-dev-001"
    resource_group_name  = "rg-axion-dev-001"
    nsg_name             = "Database-nsg"
  }
}

pip07 = {
  pip1 = {
    name                = "Frontend-pip"
    resource_group_name = "rg-axion-dev-001"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "Backend-pip"
    resource_group_name = "rg-axion-dev-001"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip3 = {
    name                = "Database-pip"
    resource_group_name = "rg-axion-dev-001"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

nic07 = {
  vm1 = {
    name                          = "Frontend-nic"
    location                      = "centralindia"
    resource_group_name           = "rg-axion-dev-001"
    subnet_name                   = "Frontend-Subnet"
    virtual_network_name          = "vnet-axion-dev-001"
    ip_configuration_name         = "frontend-ipconfig"
    private_ip_address_allocation = "Dynamic"
    public_ip_name                = "Frontend-pip"
  }
  vm2 = {
    name                          = "Backend-nic"
    location                      = "centralindia"
    resource_group_name           = "rg-axion-dev-001"
    subnet_name                   = "Backend-Subnet"
    virtual_network_name          = "vnet-axion-dev-001"
    ip_configuration_name         = "backend-ipconfig"
    private_ip_address_allocation = "Dynamic"
    public_ip_name                = "Backend-pip"
  }
  vm3 = {
    name                          = "Database-nic"
    location                      = "centralindia"
    resource_group_name           = "rg-axion-dev-001"
    subnet_name                   = "Database-Subnet"
    virtual_network_name          = "vnet-axion-dev-001"
    ip_configuration_name         = "database-ipconfig"
    private_ip_address_allocation = "Dynamic"
    public_ip_name                = "Database-pip"
  }
}

vm07 = {
  vm1 = {
    name                   = "frontend-axion-VM"
    location               = "centralindia"
    resource_group_name    = "rg-axion-dev-001"
    size                   = "Standard_B2ats_v2"
    admin_username         = "azureadmin"
    admin_password         = "Password@111"
    network_interface_name = "Frontend-nic"
  }
  vm2 = {
    name                   = "backend-axion-VM"
    location               = "centralindia"
    resource_group_name    = "rg-axion-dev-001"
    size                   = "Standard_B2ats_v2"
    admin_username         = "azureadmin"
    admin_password         = "Password@222"
    network_interface_name = "Backend-nic"
  }
  #   vm3 = {
  #     name                   = "database-axion-VM"
  #     location               = "centralindia"
  #     resource_group_name    = "rg-axion-dev-001"
  #     size                   = "Standard_B2ats_v2"
  #     admin_username         = "azureadmin"
  #     admin_password         = "Password@333"
  #     network_interface_name = "Database-nic"
  #   }
}
  postgresql_servers = {
    pgsql1 = {
      server_name            = "pgsql-axion-database"
      resource_group_name    = "rg-axion-dev-001"
      location               = "Central India"
      administrator_login    = "azureadminuser"
      administrator_password = "Password@1403"
      database_name          = "axiondb"
    }
  }

