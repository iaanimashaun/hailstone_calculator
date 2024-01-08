# Terraform module instantiation

# Instantiate the "aws_lambda_functions" module from the "./modules/aws_lambda_functions" directory
module "aws_lambda_functions" {
  source                = "./modules/aws_lambda_functions"
  lambda_configurations = var.lambda_configurations
  enviroment_variables  = var.enviroment_variables
}





module "hailstone_function_app" {
  source                     = "./modules/azure_functions"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  service_plan_name          = var.service_plan_name
  os_type                    = var.os_type
  sku_name                   = var.sku_name
  function_app_name          = var.function_app_name
}

output "hailstone_function_app_id" {
  description = "ID of the Azure Function App"
  value       = module.hailstone_function_app.function_app_id
}

output "hailstone_function_app_url" {
  description = "URL of the Azure Function App"
  value       = module.hailstone_function_app.function_app_url
}

