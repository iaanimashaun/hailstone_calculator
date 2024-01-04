

# Create Lambda functions
resource "aws_lambda_function" "lambda_functions" {
  for_each = local.lambda_configurations

  function_name = each.value.function_name
    role      = aws_iam_role.lambda_execution_role.arn
  timeout     = each.value.timeout
  image_uri   = each.value.ecr_image_uri
  memory_size = each.value.memory_size
  ephemeral_storage {
    size = each.value.size
  }

  package_type = "Image"

  environment {
    variables = each.value.environment
  }


  source_code_hash = trimprefix(each.value.ecr_image_uri_id, "sha256:")


}
