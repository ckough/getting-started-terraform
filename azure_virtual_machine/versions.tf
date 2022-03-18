terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0" # pin to specific azurerm version
    }
  }

  required_version = ">= 0.14.9" # pin to specific terraform version
}

provider "azurerm" {
  features {}
}