

# # Create Lambda functions


resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_configurations.function_name
  role          = aws_iam_role.lambda_execution_role.arn
  timeout       = var.lambda_configurations.timeout
  image_uri     = "${data.aws_ecr_repository.hailstone_calculator.repository_url}:latest"
  memory_size   = var.lambda_configurations.memory_size
  ephemeral_storage {
    size = var.lambda_configurations.size
  }

  package_type = "Image"

  environment {
    variables = var.enviroment_variables
  }

  source_code_hash = trimprefix(data.aws_ecr_repository.hailstone_calculator.id, "sha256:")
}
