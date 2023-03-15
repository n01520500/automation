resource "azurerm_availability_set" "av_set" {
  name                = "av-set"
  resource_group_name = var.resource_group_name
  location            = var.location
tags = var.tags
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.vm_count
  name                = "publicip-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
tags = var.tags
}


resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  #depends_on = [module.network.azurerm_subnet.subnet_name]
  ip_configuration {
    name                          = "nic-ip-config-${count.index + 1}"
    subnet_id 			    = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id

  }
tags = var.tags
}


resource "azurerm_linux_virtual_machine" "vm" {
  count                       = var.vm_count
  name                        = "vm-${count.index + 1}"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  size                        = var.vm_size
  network_interface_ids       = [azurerm_network_interface.nic[count.index].id]
  availability_set_id         = azurerm_availability_set.av_set.id
  admin_username              = "adminuser"
  #admin_ssh_key			= var.ssh_private_key_path

admin_ssh_key {
  username   = "adminuser"
  public_key = file(var.ssh_public_key_path)
}

  disable_password_authentication = true
  boot_diagnostics {
    #enabled = true
    storage_account_uri = var.storage_account_uri
  }
  os_disk {
    name = "osdisk-${count.index + 1}"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"

  }
    computer_name = "vm-${count.index + 1}-dnslabel"
tags = var.tags
}

resource "azurerm_virtual_machine_extension" "network_watcher_extension" {
  count                 = var.vm_count
  name                  = "network-watcher-extension-${count.index + 1}"
  virtual_machine_id    = azurerm_linux_virtual_machine.vm[count.index].id
  publisher             = "Microsoft.Azure.NetworkWatcher"
  type                  = "NetworkWatcherAgentLinux"
  type_handler_version  = "1.4"
tags = var.tags
}
