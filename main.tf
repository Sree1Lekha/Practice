terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }
}



# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "Terra_prac_rq"
  location = "West Europe"
}
# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "Terra_Prac_vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "Terra_Prac_subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
