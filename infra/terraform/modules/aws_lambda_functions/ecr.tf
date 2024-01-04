# Data block to retrieve information about an existing Amazon ECR repository
data "aws_ecr_repository" "hailstone_calculator" {
  name = "hailstone_calculator"
}

# Resource block to define an Amazon ECR lifecycle policy for the repository
resource "aws_ecr_lifecycle_policy" "hailstone_calculator_policy" {
  repository = data.aws_ecr_repository.hailstone_calculator.name

  # Define the lifecycle policy in JSON format
  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 2 images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 2
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
