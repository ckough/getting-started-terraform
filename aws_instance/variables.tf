variable "instance_type" {
  description = "The instance type to use for the instance."
  type        = string
  default     = "t3.micro"
}

variable "environment" {
  description = "Environment for this deployment."
  type        = string
  default     = "nonprod"
}