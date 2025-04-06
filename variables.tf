variable "name" {
  description = "Name of the IP group."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which the IP group will be created."
  type        = string
}

variable "location" {
  description = "Location of the resource group in which the IP group will be created, if not set it will be the same as the resource group."
  type        = string
  default     = ""
}

variable "address_spaces" {
  description = "List of address spaces for the IP group."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to be applied to the IP group."
  type        = map(string)
  default     = {}
}