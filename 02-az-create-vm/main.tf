#Resource Group Name
resource "azurerm_resource_group" "gslab-vm" {
  name     = "gslab-vm-resources"
  location = "southindia"
}

# VNET resource block , the location and rsg name is referenced from previous resource block
resource "azurerm_virtual_network" "gslab-vm" {
  name                = "gslab-vm-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.gslab-vm.location
  resource_group_name = azurerm_resource_group.gslab-vm.name
}

# Subnet resource block , 
resource "azurerm_subnet" "gslab-vm" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.gslab-vm.name
  virtual_network_name = azurerm_virtual_network.gslab-vm.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "gslab-vm" {
  name                = "gslab-vm-nic"
  location            = azurerm_resource_group.gslab-vm.location
  resource_group_name = azurerm_resource_group.gslab-vm.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.gslab-vm.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "gslab-vm" {
  name                = "gslab-vm-win"
  resource_group_name = azurerm_resource_group.gslab-vm.name
  location            = azurerm_resource_group.gslab-vm.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "test@#$567AZVM"
  network_interface_ids = [
    azurerm_network_interface.gslab-vm.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}