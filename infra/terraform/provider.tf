# Terraform configuration for AWS

# Define the required providers and their versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS provider with the specified region
provider "aws" {
  region = var.aws_region
}
