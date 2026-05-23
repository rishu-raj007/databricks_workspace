variable "prefix" {
  type        = string
  description = "A prefix to prepend to storage resource names."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where storage will be placed."
}

variable "location" {
  type        = string
  description = "The Azure region to deploy the storage account."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to resources."
  default     = {}
}
