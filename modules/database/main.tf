resource "azurerm_postgresql_server" "database" {
  name                         = "${var.prefix}-database"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = "10.0"
  administrator_login          = var.db_admin_username
  administrator_login_password = var.db_admin_password
  sku_name                     = var.db_sku_name
  storage_mb                   = var.db_storage_mb
ssl_enforcement_enabled = true


  tags = {
    Project         = "Automation Project – Assignment 1"
    Name            = "kavya.sharma"
    ExpirationDate  = "2023-06-30"
    Environment     = "Lab"
  }
}
