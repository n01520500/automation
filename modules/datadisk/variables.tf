variable "vm_count" {
  description = "The number of virtual machines to attach the data disks to"
}

variable "location" {
  description = "The location of the resource group"
}

variable "resource_group_name" {
  description = "The name of the resource group"
}
variable "subnet_id" {
  description = "The ID of the subnet where the resources will be provisioned."

}

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
variable "linux_vm_ids" {
  type = list(string)
}

variable "vmwindows_vm_id" {
  type = string
}
