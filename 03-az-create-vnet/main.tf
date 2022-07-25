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


#resource "azurerm_network_security_group" "gslab-nsg002" {
#  name                = "gslab-security-group"
#  location            = "southindia"
#  resource_group_name = "gslab-rsg001"
#}

resource "azurerm_virtual_network" "gslab-vnet" {
  name                = "gslab-vnet"
  location            = "southindia"
  resource_group_name = "azlab--adequately--thorough--monitor"
  address_space       = ["10.0.0.0/16"]
  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
}
