data "azurerm_subnet" "subnet" {
  name                 = "dev-nonproduction-1"
  virtual_network_name = "VNet-internal"
  resource_group_name  = "AzureVnet"
}

module "vm_001" {
  source              = "git::https://dev.azure.com/{SUBS}/Azure/_git/Terraform-modules//vm/cis_win_?ref=v0.0.31"
  subscription        = "{SUBS}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = data.azurerm_subnet.subnet.id
  application_name    = "datos"
  vm_id               = "001"
  vm_size             = "Standard_D2s_v3"
  ad_administrator_groups = ["GSRPCA-JP-AzureSubRG_Datos_Contributor"]
  ad_rdp_users_groups     = ["GSRPCA-JP-AzureSubRG_Datos_Contributor"]
  environment         = "Development"
}

module"vm_002"{
  source                  = "git::https://dev.azure.com/{SUBS}/Azure/_git/Terraform-modules//vm/sos/windows?ref=v0.0.44"
  sku                     = "windows2020"
  subscription            = "{SUBS}"
  resource_group_name     = module.resource_group.name
  location                = module.resource_group.location
  subnet_id               = data.azurerm_subnet.subnet.id
  static_ip               = "10.203.7.15"
  application_name        = "datos"
  vm_id                   = "002"
  vm_size                 = "Standard_F8s_v2"
  ad_administrator_groups = ["GSRPCA-JP-AzureSubRG_Datos_Contributor"]
  environment             = "Development"
}
