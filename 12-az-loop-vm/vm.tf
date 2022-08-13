resource "azurerm_virtual_machine" "vm" {
for_each                            = toset(var.vm_name)
name                                = each.value
location                            = var.location
resource_group_name                 = azurerm_resource_group.app.name
network_interface_ids               = [azurerm_network_interface. nic[each.key].id]
vm_size                             = "Standard_F2"
delete_os_disk_on_termination       = true
delete_data_disks_on_termination    = true

storage_image_reference {
publisher   = "OpenLogic"
offer       = "Centos"
sku         = "7.7"
version     = "latest"
}

storage_os_disk {
name                = "${each.key}-osdisk"
caching             = "ReadWrite"
create_option       = "FromImage"
managed_disk_type   = "Standard_LRS"
disk_size_gb        = "32"
}



storage_data_disk {
name                        = "${each.key}-disk1"
caching                     = "None"
create_option               = "Empty"
disk_size_gb                = 512
lun                         = 0
managed_disk_type           = "Standard_LRS"
}

os_profile {
computer_name               = each.value
admin_username              = "${each.key}-adm"
#computer_name              = var.vm_name
#admin_user_name            = "var.vm_name}-adm"
admin_password              = "98at+crm1350##NEW"
}

os_profile_linux_config {
disable_password_authentication = false
}

boot_diagnostics {
enabled             = "true"
storage_uri         = azurerm_storage_account.storage.primary_blob_endpoint
}

tags = {
  "Environment"         = "Production"
  Buildby               = "Gaurav Singh"
  Builddate             = "20220611"
  Bugetcode             = "TF-LAB"
}

}