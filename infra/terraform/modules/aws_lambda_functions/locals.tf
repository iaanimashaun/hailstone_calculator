


# Lambda function configurations


# locals {
#   config_file_path = "./config.json"
#   config_data      = jsondecode(file(local.config_file_path))

#   lambda_configurations = {
#     hailstone_calculator_function = {
#       function_name = "${terraform.workspace}_hailstone_calculator_function",
#       handler       = "app.lambda_handler",
#       runtime       = "python3.10",
#       ecr_image_uri    = "${data.aws_ecr_repository.hailstone_calculator.repository_url}:latest",
#       ecr_image_uri_id = data.aws_ecr_repository.hailstone_calculator.id,
#       environment = merge(
#         local.config_data.common_environment_variables,
#         terraform.workspace == "dev" ? local.config_data.dev_environment_variables : local.config_data.prod_environment_variables
#       ),
#       workspace_configurations = local.config_data.workspace_configurations[terraform.workspace],

#     },
#   }
# }




locals {
  config_file_path = "./config.json"
  config_data      = jsondecode(file(local.config_file_path))

  lambda_configurations = {
    hailstone_calculator_function = {
      function_name = "${terraform.workspace}_hailstone_calculator_function",
      handler       = "app.lambda_handler",
      runtime       = "python3.10",
      ecr_image_uri    = "${data.aws_ecr_repository.hailstone_calculator.repository_url}:latest",
      ecr_image_uri_id = data.aws_ecr_repository.hailstone_calculator.id,
      environment = merge(
        local.config_data.common_environment_variables,
        terraform.workspace == "dev" ? local.config_data.dev_environment_variables : local.config_data.prod_environment_variables
      ),
      workspace_configurations = local.config_data.workspace_configurations[terraform.workspace],
      timeout = local.config_data.workspace_configurations[terraform.workspace].timeout,
      size = local.config_data.workspace_configurations[terraform.workspace].size,
      memory_size = local.config_data.workspace_configurations[terraform.workspace].memory_size,
    },
  }
}
