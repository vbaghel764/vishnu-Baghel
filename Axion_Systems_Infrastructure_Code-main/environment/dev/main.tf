module "resource_group" {
  source = "../../child_module/azurerm_resource_group"
  rgs07  = var.rgs07
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_virtual_network"
  vnet07     = var.vnet07
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../child_module/azurerm_subnet"
  snet07     = var.snet07
}

module "network_security_group" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_nsg"
  nsg07      = var.nsg07
}

module "nsg_association" {
  depends_on = [module.subnet, module.network_security_group]
  source     = "../../child_module/azurerm_subnet_nsg_association"
  asso07     = var.asso07
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_public_ip"
  pip07      = var.pip07
}

module "network_interface" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../child_module/azurerm_nic"
  nic07      = var.nic07
}

module "virtual_machine" {
  depends_on = [module.network_interface]
  source     = "../../child_module/azurerm_virtual_machine"
  vm07       = var.vm07
}

module "postgresql" {
  depends_on         = [module.resource_group, module.subnet]
  source             = "../../child_module/azurerm_postgresql_flexible_server"
  postgresql_servers = var.postgresql_servers
}