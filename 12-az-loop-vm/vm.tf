resource "azurerm_virtual_machine" "vm" {
for_each                            = toset(var.vm_name)
name                                = each.value
location                            = var.location
resource_group_name                 = azurerm_resource_group.app.name
network_interface_ids               = [azurerm_network_interface. nic[each.key].id]
vm_size                             = "Standard_D8s_V3"
delete_os_disk_on_termination       = true
delete_data_disks_on_termination    = true

storage image_reference {
publisher   = "OpenLogic"
offer       = "Centos"
sku         = "7.7"
version     = "latest"
}

storage_os_disk {
name                = "${each.key}-osdisk"
caching             = "ReadWrite"
create_option       = "FromImage"
managed_disk_type   = "Premium_LRS"
disk_size_gb        = "32"
}



storage_data_disk {
name                = "$feach.key)-disk1"
caching             = "None"
create_option       = "Empty"
disk_size_gb        = 512
lun                 = 0
managemanaged_disk_type = "Premium_LRS"
}

os_profile {
computer_name               = each.value
admin_username              = "${each.key}-adm"
#Computer_name = Var. Vm_name
#admin_use rname= Var. vm_name) - adm"
admin_password              = "o0KgciM89 u6kFq5be03YPrFDj FLDjn7e "
}

os profile_linux_config {
disable_password_authentication = false
}

boot_diagnostics {
enabled             = "true"
storage_uri         = azurerm_storage_account. storage.primary_blob_endpoint
}

tags = {
  "Environment"         = "Production"
  Buildby               = "Gaurav Singh"
  Builddate             = "20220611"
  Bugetcode             = "Blog"
}

}