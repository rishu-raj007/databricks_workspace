variable "prefix" {
  type        = string
  description = "A prefix to prepend to all resource names to ensure uniqueness."
  default     = "db-dev"
}

variable "location" {
  type        = string
  description = "The Azure region where all resources will be deployed."
  default     = "eastus"
}

variable "workspaces" {
  type = map(object({
    vnet_cidr           = string
    public_subnet_cidr  = string
    private_subnet_cidr = string
    sku                 = optional(string, "premium")
  }))
  description = "A map of Databricks workspaces to deploy dynamically."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
  default = {
    Environment = "Development"
    Owner       = "DataPlatform"
    ManagedBy   = "Terraform"
  }
}
