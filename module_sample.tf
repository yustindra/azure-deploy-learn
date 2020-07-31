module "{MODULE_NAME}" {
  source              = "git::https://dev.azure.com/{ORG}/{PRODUCTS}/_git/terraform//modules/data-kitchen?ref=20200527.9"
  resource_group_name = module.resource_group.name
  data_kitchen_name   = "{DK_NAME}"
  environment         = "dev"
  instance            = "001"
  admin_AD_group      = "{ADMIN_SG}"
  user_AD_group       = "{USERS_SG}"
}
