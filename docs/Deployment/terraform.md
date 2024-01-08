## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.31.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.86.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_lambda_functions"></a> [aws\_lambda\_functions](#module\_aws\_lambda\_functions) | ./modules/aws_lambda_functions | n/a |
| <a name="module_hailstone_function_app"></a> [hailstone\_function\_app](#module\_hailstone\_function\_app) | ./modules/azure_functions | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy resources. | `string` | `"us-east-1"` | no |
| <a name="input_enviroment_variables"></a> [enviroment\_variables](#input\_enviroment\_variables) | n/a | `map(string)` | n/a | yes |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | Name of the Azure Function App | `string` | n/a | yes |
| <a name="input_lambda_configurations"></a> [lambda\_configurations](#input\_lambda\_configurations) | n/a | <pre>object({<br>    function_name = string<br>    timeout       = number<br>    memory_size   = number<br>    size          = number<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for all resources | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Operating System type for the Function App (e.g., Linux) | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the Azure Resource Group | `string` | n/a | yes |
| <a name="input_service_plan_name"></a> [service\_plan\_name](#input\_service\_plan\_name) | Name of the Azure App Service Plan | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | SKU name for the App Service Plan (e.g., Y1) | `string` | n/a | yes |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | Access key for the Azure Storage Account | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Name of the Azure Storage Account | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hailstone_function_app_id"></a> [hailstone\_function\_app\_id](#output\_hailstone\_function\_app\_id) | ID of the Azure Function App |
| <a name="output_hailstone_function_app_url"></a> [hailstone\_function\_app\_url](#output\_hailstone\_function\_app\_url) | URL of the Azure Function App |
