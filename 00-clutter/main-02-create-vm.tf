#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine


resource "azurerm_resource_group" "test-vm-rsg" {
   name     = "test-rsg-vm-001"
   location = "southindia"
 }

 #resource "azurerm_virtual_network" "test" {
 #  name                = "gslab-vnet-vm"
 #  address_space       = ["10.0.0.0/16"]
 #  location            = azurerm_resource_group.test.location
 #  resource_group_name = azurerm_resource_group.test.name
 #}

 resource "azurerm_subnet" "test-vm-subnet" {
   name                 = "test-vm-subnet-001"
   resource_group_name  = "test-rsg-vm-001"
   virtual_network_name = "gslab-vnet"
   address_prefixes     = ["10.0.20.0/24"]
 }

 resource "azurerm_public_ip" "test" {
   name                         = "publicIPForLB"
   location                     = "southindia"
   resource_group_name          = "test-rsg-vm-001"
   allocation_method            = "Static"
 }

# resource "azurerm_lb" "test" {
#   name                = "loadBalancer"
#   location            = azurerm_resource_group.test.location
#   resource_group_name = azurerm_resource_group.test.name

#   frontend_ip_configuration {
#     name                 = "publicIPAddress"
#     public_ip_address_id = azurerm_public_ip.test.id
#   }
# }

 #resource "azurerm_lb_backend_address_pool" "test" {
 #  loadbalancer_id     = azurerm_lb.test.id
 #  name                = "BackEndAddressPool"
 #}

 #resource "azurerm_network_interface" "test" {
 #  count               = 2
 #  name                = "acctni${count.index}"
 #  location            = azurerm_resource_group.test.location
 #  resource_group_name = azurerm_resource_group.test.name

  # ip_configuration {
  #   name                          = "testConfiguration"
  #   subnet_id                     = azurerm_subnet.test.id
  #   private_ip_address_allocation = "dynamic"
  # }
 #}

 resource "azurerm_managed_disk" "test" {
   name                 = "test-vm-disk"
   location             = "southindia"
   resource_group_name  = "test-rsg-vm-001"
   storage_account_type = "Standard_LRS"
   create_option        = "Empty"
   disk_size_gb         = "60"
 }

# resource "azurerm_availability_set" "avset" {
#   name                         = "avset"
#   location                     = azurerm_resource_group.test.location
#   platform_fault_domain_count  = 2
#   platform_update_domain_count = 2
#   managed                      = true
# }

 

 