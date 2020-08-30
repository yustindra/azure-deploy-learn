data "azurerm_subscription" "current" {}

resource "azurerm_virtual_machine" "example" {
  # ...

  identity {
    type = "SystemAssigned"
  }
}

data "azurerm_role_definition" "contributor" {
  name = "Contributor"
}

resource "azurerm_role_assignment" "example" {
  name               = azurerm_virtual_machine.example.name
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = "${data.azurerm_subscription.subscription.id}${data.azurerm_role_definition.contributor.id}"
  principal_id       = azurerm_virtual_machine.example.identity[0]["principal_id"]
}
