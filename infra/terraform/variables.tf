# Variable definition for AWS region 

# The AWS region to deploy resources.
variable "aws_region" {
  description = "The AWS region to deploy resources."
  default     = "us-east-1"
}



variable "lambda_configurations" {
  type = object({
    function_name = string
    timeout       = number
    memory_size   = number
    size          = number
  })
}

variable "enviroment_variables" {
  type      = map(string)
  sensitive = true
}









variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Location for all resources"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "storage_account_access_key" {
  description = "Access key for the Azure Storage Account"
  type        = string
}

variable "service_plan_name" {
  description = "Name of the Azure App Service Plan"
  type        = string
}

variable "os_type" {
  description = "Operating System type for the Function App (e.g., Linux)"
  type        = string
}

variable "sku_name" {
  description = "SKU name for the App Service Plan"
  type        = string
}

variable "function_app_name" {
  description = "Name of the Azure Function App"
  type        = string
}
