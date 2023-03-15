output "vm_hostnames" {
  value = [azurerm_linux_virtual_machine.vm[0].name, azurerm_linux_virtual_machine.vm[1].name]
}

output "vm_domain_names" {
  value = [azurerm_linux_virtual_machine.vm[0].computer_name, azurerm_linux_virtual_machine.vm[1].computer_name]
}

output "vm_private_ips" {
  value = [azurerm_network_interface.nic[0].private_ip_address, azurerm_network_interface.nic[1].private_ip_address]
}

output "vm_public_ips" {
  value = [azurerm_public_ip.public_ip[0].ip_address, azurerm_public_ip.public_ip[1].ip_address]
}
output "vm_ids" {
  value = azurerm_linux_virtual_machine.vm.*.id
}
