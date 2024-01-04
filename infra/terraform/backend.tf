
# terraform {
#   backend "s3" {
#     bucket               = "terraform-state-hailstone"
#     key                  = "terraform.tfstate"
#     region               = "us-east-1"
#     encrypt              = true
#     workspace_key_prefix = "tf-state"
#     dynamodb_table       = "hailstone_terraform_state_locking" # Use DynamoDB for state locking

#   }
# }