# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.13.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "renate2"
  location = "westus2"
}

resource "azurerm_container_registry" "acr" {
  name                = "containerRegistryRenate1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
  georeplications {
    location                = "westeurope"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "westeurope"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}
