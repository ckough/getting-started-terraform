variable "instance_type" {
  description = "AMI to use for the instance."
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "Environment for this deployment."
  type        = string
  default     = "nonprod"
}