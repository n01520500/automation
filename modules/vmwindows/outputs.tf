output "vm_hostname" {
  value = azurerm_virtual_machine.vm_windows.os_profile[*].computer_name
}

#output "vm_domain_name" {
  #value = azurerm_virtual_machine.vm_windows.os_profile_windows_config[*].domain_name
#}


output "vm_private_ip_address" {
  value = azurerm_network_interface.vm_nic.private_ip_address
}

output "vm_public_ip_address" {
  value = azurerm_public_ip.vm_windows_public_ip.ip_address
}
output "vm_id" {
  value = azurerm_virtual_machine.vm_windows.id
}
