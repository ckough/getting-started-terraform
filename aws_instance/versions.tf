terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # pin to specific aws version
    }
  }

  # Stores the state as a given key in a given bucket on Amazon S3.
  # backend "s3" {
  #   bucket = "getting-started-terraform"
  #   key    = "getting-started-terraform.tfstate"
  #   region = "ap-southeast-2"
  # }

  required_version = ">= 0.14.9" # pin to specific terraform version
}

provider "aws" {
  region = "ap-southeast-2" # Sydney
}