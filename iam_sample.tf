############################
#Logic App Contributor role
############################
resource "azurerm_role_assignment" "logic_app_contributor" {  
  scope                = module.resource_group.id
  role_definition_name = "Logic App Contributor"
  principal_id         = data.azuread_user.account1.id
}

##############################
#Data Factory contributor role
##############################
resource "azurerm_role_assignment" "data_factory_contributor" {  
  scope                = module.resource_group.id
  role_definition_name = "Data Factory contributor"
  principal_id         = data.azuread_user.account1.id
}
