variable "public_subnet_id" {
  type        = string
  description = "The ID of the public subnet."
}

variable "public_nsg_id" {
  type        = string
  description = "The ID of the NSG to associate with the public subnet."
}

variable "private_subnet_id" {
  type        = string
  description = "The ID of the private subnet."
}

variable "private_nsg_id" {
  type        = string
  description = "The ID of the NSG to associate with the private subnet."
}
