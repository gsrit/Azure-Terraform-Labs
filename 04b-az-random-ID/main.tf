#https://docs.microsoft.com/en-us/azure/developer/terraform/create-resource-group?tabs=azure-cli

#resource "azurerm_virtual_network" "gslab-vnet" {
#  name                = "gslab-network"
#  address_space       = ["10.1.0.0/16"]
#  location            = "southindia"
#  resource_group_name  = "gslab-rsg001"
#}

#resource "azurerm_subnet" "gslab-vnet-subnet" {
#  name                 = "gslab-subnet"  
#  resource_group_name  = "gslab-rsg001"
#  virtual_network_name = "gslab-vnet"
#  address_prefix     = "10.1.1.0/24"

#  enforce_private_link_endpoint_network_policies = true
#}

#resource "azurerm_resource_group" "gslab-rsg-002" {
#  name     = "gslab-002"
#  location = "southindia"
#}


resource "random_pet" "rg-name" {
  prefix    = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  name      = random_pet.rg-name.id
  location  = var.resource_group_location
}

# MD2
