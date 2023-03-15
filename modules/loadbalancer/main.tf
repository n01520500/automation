resource "azurerm_public_ip" "lbpublicip" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = "mylb"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                          = "PublicIPAddress"
    public_ip_address_id          = azurerm_public_ip.lbpublicip.id
  }
}


resource "azurerm_lb_backend_address_pool" "pool" {
  count               = 2
  name                = "pool-${count.index + 1}"
  loadbalancer_id     = azurerm_lb.lb.id
 # backend_ip_addresses = var.linux_vm_ids
}

resource "azurerm_lb_probe" "probe" {
  name                = "probe"
  protocol            = "Http"
  port                = var.lb_probe_port
  interval_in_seconds = 5
  number_of_probes    = 2
  request_path        = "/"
  loadbalancer_id     = azurerm_lb.lb.id
}
