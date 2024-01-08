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
  description = "SKU name for the App Service Plan (e.g., Y1)"
  type        = string
}

variable "function_app_name" {
  description = "Name of the Azure Function App"
  type        = string
}
