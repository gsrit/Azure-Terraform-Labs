
resource "azurerm_resource_group" "azvm-rg" {
  location = "southindia"
  name     = "azvm-rg"
}

resource "azurerm_virtual_network" "azvnet" {
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.azvm-rg.location
  name                = "azvnet"
  resource_group_name = azurerm_resource_group.azvm-rg.name
}

resource "azurerm_subnet" "azsubnet1" {
  name                 = "azsubnet1"
  resource_group_name  = azurerm_resource_group.azvm-rg.name
  virtual_network_name = azurerm_virtual_network.azvnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "aznetworkinterface3" {
  location            = azurerm_resource_group.azvm-rg.location
  name                = "aznetworkinterface"
  resource_group_name = azurerm_resource_group.azvm-rg.name
  ip_configuration {
    name                          = "aznetworkinterfaceip"
    subnet_id                     = azurerm_subnet.azsubnet1.id
    private_ip_address_allocation = "Dynamic"
    
  }
}



## Adding Public IP with a new network interface
resource "azurerm_public_ip" "public_ip" {
  name                = "vm_public_ip"
  resource_group_name = azurerm_resource_group.azvm-rg.name
  location            = azurerm_resource_group.azvm-rg.location
  allocation_method   = "Dynamic"
}


resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.azvm-rg.location
  resource_group_name = azurerm_resource_group.azvm-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.azsubnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}



# az vm image list --output table
# az vm image list --all
# az vm image list-offers -l westus -p MicrosoftWindowsServer
# az vm image list -f CentOS

resource "azurerm_windows_virtual_machine" "winvm1" {
  admin_password        = "99340@AIRTEL#2022"
  admin_username        = "homelab"
  location              = azurerm_resource_group.azvm-rg.location
  name                  = "winvm1"
  #network_interface_ids = [azurerm_network_interface.aznetworkinterface.id]
  network_interface_ids = [azurerm_network_interface.example.id]
  resource_group_name   = azurerm_resource_group.azvm-rg.name
  size                  = "standard_f2"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  
}



