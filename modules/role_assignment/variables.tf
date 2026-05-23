variable "scope" {
  type        = string
  description = "The scope at which the role assignment should be created (e.g., Storage Account resource ID)."
}

variable "principal_id" {
  type        = string
  description = "The principal ID of the Managed Identity receiving the permissions."
}
