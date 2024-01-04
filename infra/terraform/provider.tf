# Terraform configuration for AWS

# Define the required providers and their versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.26"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {

  }
}