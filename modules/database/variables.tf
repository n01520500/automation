variable "db_name" {
  description = "Name of the Azure DB - PostgreSQL instance"
}

variable "db_sku_name" {
  description = "DB SKU name for the Azure DB for PostgreSQL"
  default     = "B_Gen5_1"
}

variable "db_storage_mb" {
  default     = 5120
}

variable "db_admin_username" {
  description = "Username for admin account"
}

variable "db_admin_password" {
  description = "Password for admin account"
}

variable "resource_group_name"{}
variable "location"{}
variable "prefix"{}
