variable "db_name" {
  description = "Name of the Azure DB for PostgreSQL instance"
}

variable "db_sku_name" {
  description = "Name of the SKU to use for the Azure DB for PostgreSQL instance"
  default     = "B_Gen5_1"
}

variable "db_storage_mb" {
  description = "Amount of storage to allocate for the Azure DB for PostgreSQL instance (in MB)"
  default     = 5120
}

variable "db_admin_username" {
  description = "Username for the admin account of the Azure DB for PostgreSQL instance"
}

variable "db_admin_password" {
  description = "Password for the admin account of the Azure DB for PostgreSQL instance"
}


variable "resource_group_name"{}

variable "location"{}
variable "prefix"{}
