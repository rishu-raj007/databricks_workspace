variable "prefix" {
  type        = string
  description = "A prefix to prepend to workspace resource names."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the workspace will be placed."
}

variable "location" {
  type        = string
  description = "The Azure region to deploy the workspace."
}

variable "sku" {
  type        = string
  description = "The SKU/pricing tier of the workspace."
  default     = "premium"
}

variable "vnet_id" {
  type        = string
  description = "The ID of the Virtual Network where Databricks will be injected."
}

variable "public_subnet_name" {
  type        = string
  description = "The name of the public subnet."
}

variable "private_subnet_name" {
  type        = string
  description = "The name of the private subnet."
}

variable "public_subnet_nsg_association_id" {
  type        = string
  description = "The ID of the public subnet NSG association."
}

variable "private_subnet_nsg_association_id" {
  type        = string
  description = "The ID of the private subnet NSG association."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to resources."
  default     = {}
}
