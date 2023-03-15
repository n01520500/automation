resource "azurerm_network_interface" "vm_nic" {
  name                = "0500vm-nic-windows"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "vm-ip-config-windows"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_windows_public_ip.id
  }
}

resource "azurerm_virtual_machine" "vm_windows" {
  tags 			= var.tags
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  vm_size               = var.vm_size

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = var.os_disk_name
    create_option     = "FromImage"
    caching           = "ReadWrite"
    managed_disk_type = "Premium_LRS"
  }

os_profile {
  computer_name  = var.vm_name
  admin_username = var.admin_username
  admin_password = var.admin_password
}

os_profile_windows_config {
  enable_automatic_upgrades = true
  provision_vm_agent        = true
}


  availability_set_id = azurerm_availability_set.windows_avail_set.id

  boot_diagnostics {
    enabled     = true
    storage_uri = var.boot_diagnostics_storage_uri
  }
}

resource "azurerm_public_ip" "vm_windows_public_ip" {
  name                = "0500vm-windows-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  domain_name_label   = var.public_ip_dns_label

  tags = var.tags
}

resource "azurerm_availability_set" "windows_avail_set" {
  name                = var.avail_set_name
  location            = var.location
  resource_group_name = var.resource_group_name

  platform_fault_domain_count   = 2
  platform_update_domain_count = 2

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "vm_windows_extension" {
  virtual_machine_id   = azurerm_virtual_machine.vm_windows.id
  name                 = var.antimalware_extension_name
  publisher            = var.antimalware_extension_publisher
  type                 = var.antimalware_extension_type
  type_handler_version = var.antimalware_extension_version
  auto_upgrade_minor_version = true
  settings = <<SETTINGS
{
      "AntimalwareEnabled": true,
  "commandToExecute": "powershell -ExecutionPolicy Unrestricted -Command 'Write-Output ''Hello, world!'''"
}
SETTINGS

  depends_on = [
    azurerm_virtual_machine.vm_windows
  ]
}
