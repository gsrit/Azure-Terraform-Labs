terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.21.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}

resource "azurerm_resource_group" "tf-rsg" {
  name = "test-rsg"
  location = "southindia"
  
}

resource "azurevm" "name" {
  
}