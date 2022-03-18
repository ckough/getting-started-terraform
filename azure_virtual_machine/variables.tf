variable "vm_size" {
  description = "Specifies the size of the Virtual Machine."
  type        = string
  default     = "Standard_B1s"
}

variable "environment" {
  description = "Environment for this deployment."
  type        = string
  default     = "nonprod"
}