variable "prefix" {
  type        = string
  description = "A prefix to prepend to NSG names."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where NSGs will be placed."
}

variable "location" {
  type        = string
  description = "The Azure region to deploy the NSGs."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to resources."
  default     = {}
}
