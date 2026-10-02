
module "resource_group" {
  source = "../../child_module/azurerm_resource_group"
  rg27   = var.rg27
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_virtual_network"
  vnet27     = var.vnet27
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../child_module/azurerm_subnet"
  snet27     = var.snet27
}

module "network_security_group" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_network_security_group"
  nsg27      = var.nsg27
}

module "nsg_association" {
  depends_on = [module.subnet, module.network_security_group]
  source     = "../../child_module/azurerm_subnet_network_security_group_association"
  nsgaso27   = var.nsgaso27
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_public_ip"
  pip27      = var.pip27
}

module "nat_gateway" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_nat_gateway"
  nat27      = var.nat27
}

module "nat_gateway_public_ip_association" {
  depends_on  = [module.public_ip, module.nat_gateway]
  source      = "../../child_module/azurerm_nat_gateway_public_ip_association"
  natpipaso27 = var.natpipaso27
}

module "nat_gateway_subnet_association" {
  depends_on = [module.subnet, module.nat_gateway]
  source     = "../../child_module/azurerm_subnet_nat_gateway_association"
  natsub27   = var.natsub27
}

module "bastion" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../child_module/azurerm_bastion_host"
  bastion27  = var.bastion27
}

module "application_gateway" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../child_module/azurerm_application_gateway"
  appgw27    = var.appgw27
}

module "network_interface" {
  depends_on = [module.subnet]
  source     = "../../child_module/azurerm_network_interface"
  nic27      = var.nic27
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_key_vault"
  keyvault27 = var.keyvault27
}

module "key_vault_role_assignment" {
  depends_on     = [module.key_vault]
  source         = "../../child_module/azurerm_key_vault_role_assignment"
  keyvaultrole27 = var.keyvaultrole27
}

module "key_vault_secret" {
  depends_on       = [module.key_vault_role_assignment]
  source           = "../../child_module/azurerm_key_vault_secret"
  keyvaultsecret27 = var.keyvaultsecret27
}

module "virtual_machine" {
  depends_on = [module.key_vault_secret, module.network_interface]
  source     = "../../child_module/azurerm_linux_virtual_machine"
  vms        = var.vms
}