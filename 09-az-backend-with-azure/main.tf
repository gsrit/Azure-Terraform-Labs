# Lab to configure the backend on Azure Storage 
# The state file will be stored on the Azure Storage


terraform {

  required_version = ">=0.12"
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }

  # Add Resource Group / Storage Account Name / Container Name
  
  backend "azurerm" {
    resource_group_name = "tfstateRG01"
    storage_account_name = "tfstate01418297508"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}


###########################################################################
/*()
#  VM resource Block
resource "azurerm_linux_virtual_machine" "myterraformvm" {
    name                  = "myVM"
    location              = "eastus"
    resource_group_name   = azurerm_resource_group.myterraformgroup.name
    network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

        
		
}

# Backend Configurationdata 

*/


resource "azurerm_resource_group" "rg" {
  name      = "test-rsg-tf-backend"
  location  = "southindia"
}
