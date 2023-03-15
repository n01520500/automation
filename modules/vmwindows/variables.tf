variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    Project        = "Automation Project – Assignment 1"
    Name           = "kavya.sharma"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}

variable "location" {
  default = "eastus"
}

variable "resource_group_name" {
  default = "N01520500-assignment1-RG"
}

variable "subnet_id" {

}

variable "vm_name" {
  default = "vm-windows"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "adminuser"
}

variable "admin_password" {
  default = "Kavya@1101"
}

variable "os_disk_name" {
  default = "osdisk-windows"
}

variable "os_type" {
  default = "Windows"
}

variable "dns_label" {
  default = "mywindowsvm"
}

variable "avail_set_name" {
  default = "0500windows-avail-set"
}

variable "public_ip_dns_label" {
  default = "public-ip-0500"
}

variable "antimalware_extension_name" {
  default = "IaaSAntimalware"
}

variable "antimalware_extension_publisher" {
  default = "Microsoft.Azure.Security"
}

variable "antimalware_extension_type" {
  default = "IaaSAntimalware"
}

variable "antimalware_extension_version" {
  default = "1.3"
}


variable "boot_diagnostics_storage_uri" {

}
