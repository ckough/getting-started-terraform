# Getting Started with Terraform

## Overview

Infrastructure as code (IaC) tools allow you to manage infrastructure with configuration files rather than through a graphical user interface. IaC allows you to build, change, and manage your infrastructure in a safe, consistent, and repeatable way by defining resource configurations that you can version, reuse, and share. Terraform is HashiCorp's infrastructure as code tool. It lets you define resources and infrastructure in human-readable, declarative configuration files, and manages your infrastructure's lifecycle.

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

The command line interface to Terraform is via the `terraform` command, which accepts a variety of subcommands such as `terraform init` or `terraform plan`. To view a list of the commands available in your current Terraform version, run `terraform` with no additional arguments:

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