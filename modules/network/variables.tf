variable "prefix" {
  type        = string
  description = "A prefix to prepend to all network resource names."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where network resources will be placed."
}

variable "location" {
  type        = string
  description = "The Azure region to deploy the network."
}

variable "vnet_cidr" {
  type        = string
  description = "The CIDR address block for the VNet."
}

variable "public_subnet_cidr" {
  type        = string
  description = "The address prefix for the public node subnet."
}

variable "private_subnet_cidr" {
  type        = string
  description = "The address prefix for the private container subnet."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to resources."
  default     = {}
}
