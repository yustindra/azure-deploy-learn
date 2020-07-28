provider "azurerm" {
  version         = "~> 2.16.0"
  subscription_id = "{SUBSCRIPTION_ID}"
  features {}
}

terraform {
  required_version = ">= 0.12.23"
  backend "azurerm" {
    subscription_id      = "{SUBSCRIPTION_ID}"
    resource_group_name  = "{RESOURCE_GROUP_NAME}"
    storage_account_name = "{STORAGE_ACCOUNT_NAME}"
    container_name       = "terraform"
    key                  = "kotakpasir.tfstate"
  }
}
