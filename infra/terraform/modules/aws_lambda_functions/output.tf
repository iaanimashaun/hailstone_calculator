
output "lambda_function_arn" {
  description = "Lambda function arn"
  value       = aws_lambda_function.lambda_function.arn
}
