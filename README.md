# Getting Started with Terraform

## Overview

Infrastructure as code (IaC) tools allow you to manage infrastructure with configuration files rather than through a graphical user interface. IaC allows you to build, change, and manage your infrastructure in a safe, consistent, and repeatable way by defining resource configurations that you can version, reuse, and share.

Terraform is HashiCorp's infrastructure as code tool. It lets you define resources and infrastructure in human-readable, declarative configuration files, and manages your infrastructure's lifecycle.

## Deployment Workflow

To deploy infrastructure with Terraform:

- Scope - Identify the infrastructure for your project.  
- Author - Write the configuration for your infrastructure.  
- Initialize - Install the plugins Terraform needs to manage the infrastructure.  
- Plan - Preview the changes Terraform will make to match your configuration.  
- Apply - Make the planned changes.

## Install Terraform

[Homebrew](https://brew.sh/) is a free and open-source package management system for Mac OS X. Install the official [Terraform formula](https://github.com/hashicorp/homebrew-tap) from the terminal.

First, install the HashiCorp tap, a repository of all our Homebrew packages.

```
brew tap hashicorp/tap
```

Now, install Terraform with hashicorp/tap/terraform.

```
brew install hashicorp/tap/terraform
```

## Prerequisites

- Terraform 0.14.9 or later
- [AWS Account](https://aws.amazon.com/free/)
- The [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) installed and configured
- [Azure Account](https://azure.microsoft.com/en-us/free/)
- The [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and configured

## Basic CLI Features

The command line interface to Terraform is via the `terraform` command, which accepts a variety of subcommands such as `terraform init` or `terraform plan`.

To view a list of the commands available in your current Terraform version, run `terraform` with no additional arguments:

```
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure
```

## Terraform Block

The `terraform {}` block contains Terraform settings, including the required providers Terraform will use to provision your infrastructure. For each provider, the `source` attribute defines an optional hostname, a namespace, and the provider type. Terraform installs providers from the [Terraform Registry](https://registry.terraform.io/) by default.

You can also set a version constraint for each provider defined in the `required_providers` block. The `version` attribute is optional, but we recommend using it to constrain the provider version so that Terraform does not install a version of the provider that does not work with your configuration. If you do not specify a provider version, Terraform will automatically download the most recent version during initialization.

```
terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}
```

## Providers

The `provider` block configures the specified provider. A provider is a plugin that Terraform uses to create and manage your resources.

You can use multiple provider blocks in your Terraform configuration to manage resources from different providers. You can even use different providers together. For example, you could pass the IP address of your AWS EC2 instance to a monitoring resource from DataDog.

```
provider "aws" {
  profile = "default"
  region  = "ap-southeast-2"
}
```

## Resources

Use `resource` blocks to define components of your infrastructure. A resource might be a physical or virtual component such as an EC2 instance, or it can be a logical resource such as a Heroku application.

Resource blocks contain arguments which you use to configure the resource. Arguments can include things like machine sizes, disk image names, or VPC IDs. The [providers reference](https://www.terraform.io/docs/providers/index.html) documents the required and optional arguments for each resource.

```
resource "aws_instance" "web" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
}
```

## Data Sources

Data sources allow Terraform to use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions. Each provider may offer data sources alongside its set of resource types.

```
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}
```

## Local Values

A local value assigns a name to an expression, so you can use it multiple times within a module without repeating it. Local values are like a function's temporary local variables.

```
locals {
  service_name = "forum"
  owner        = "Community Team"
}
```

## Input Variables

Input variables let you customize aspects of Terraform modules without altering the module's own source code. This allows you to share modules across different Terraform configurations, making your module composable and reusable.

When you declare variables in the root module of your configuration, you can set their values using CLI options and environment variables. Input variables are like function arguments.

```
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default     = "ami-a1b2c3d4"
}
```

## Output Values

Output values make information about your infrastructure available on the command line, and can expose information for other Terraform configurations to use. Output values are similar to return values in programming languages.

```
output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
```

## Expressions

Expressions are used to refer to or compute values within a configuration. The simplest expressions are just literal values, like `"hello"` or `5`, but the Terraform language also allows more complex expressions such as references to data exported by resources, arithmetic, conditional evaluation, and a number of built-in functions.

Expressions can be used in a number of places in the Terraform language, but some contexts limit which expression constructs are allowed, such as requiring a literal value of a particular type or forbidding references to resource attributes. Each language feature's documentation describes any restrictions it places on expressions.

```
var.a != "" ? var.a : "default-a"
```

## State

Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

This state is stored by default in a local file named "terraform.tfstate", but it can also be stored remotely, which works better in a team environment.

Terraform uses this local state to create plans and make changes to your infrastructure. Prior to any operation, Terraform does a refresh to update the state with the real infrastructure.

```
backend "s3" {
  bucket = "getting-started-terraform"
  key    = "getting-started-terraform.tfstate"
  region = "ap-southeast-2"
}
```

## Utilities

[tfsec](https://aquasecurity.github.io/tfsec/latest) is a static analysis security scanner for your Terraform code.

[tflint](https://github.com/terraform-linters/tflint) is a pluggable Terraform linter.

[terraform-docs](https://terraform-docs.io) is a documentation generator for Terraform.

[infracost](https://www.infracost.io) shows you how much money you're spending on your infrastructure.