# Terraform module instantiation

# Instantiate the "aws_lambda_functions" module from the "./modules/aws_lambda_functions" directory
module "aws_lambda_functions" {
  source = "./modules/aws_lambda_functions"
}
