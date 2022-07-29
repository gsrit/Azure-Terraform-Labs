output "resource_group_name" {
  value = azurerm_resource_group.azvm-rg.name
}

output "public_ip_address" {
  value = azurerm_windows_virtual_machine.winvm1.public_ip_address
}

output "id-vm" {
  value = azurerm_windows_virtual_machine.winvm1.computer_name
  
}

output "Private-IP-Address" {
  value = azurerm_windows_virtual_machine.winvm1.private_ip_address
}
