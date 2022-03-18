# A local value assigns a name to an expression, so you can use it multiple times within a module without repeating it.
locals {
  account_id = data.aws_caller_identity.current.account_id
  linux_ami  = data.aws_ami.linux

  tags = {
    Project     = "getting-started-terraform"
    Owner       = "Mark Carriedo"
    Environment = var.environment
  }
}