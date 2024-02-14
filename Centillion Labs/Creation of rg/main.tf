terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "jaisurya" {
  name     = "example-resource"
  location = "West Europe"
}

resource "azurerm_storage_account" "adls" {
  name                     = "jaisuryasaccount"
  resource_group_name      = azurerm_resource_group.jaisurya.name
  location                 = azurerm_resource_group.jaisurya.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true

  identity {
    type = "SystemAssigned"
  }
}
