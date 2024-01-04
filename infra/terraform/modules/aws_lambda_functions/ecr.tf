

data "aws_ecr_repository" "hailstone_calculator" {
  name     = "hailstone_calculator"
}



resource "aws_ecr_lifecycle_policy" "hailstone_calculator_policy" {
  repository = "hailstone_calculator"

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

