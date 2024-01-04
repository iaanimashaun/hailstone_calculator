# Deployment Instructions

This document provides instructions for deploying the Hailstone Calculator project.

## Environment Setup


Environment Configuration

The project relies on environment variables configured in the .env file.

```
DOCKER_IMAGE_NAME = <image name>
DOCKER_IMAGE_TAG = 
AWS_ECR_REPO_URI = <AccountID>.dkr.ecr.<region>.amazonaws.com/<image name>
AWS_ECR_REPO_NAME = <ecr_repository_name>
AWS_REGION = <aws region>
AWS_ACCOUNT_ID = <AccountID>
SRC_DIR = src
LAMBDA_FUNCTION_DIR = infra/aws/lambda/hailstone_calculator
LOG_DIR = logs
TERRAFORM_DIR = infra/terraform
```

The variables for provisioning AWS lambda using terraform are defined in the config.json file

```json
{
    "common_environment_variables": {
      
    },
    "pre_prod_environment_variables": {
      
    },
    "prod_environment_variables": {
      
    },
    "workspace_configurations": {
        "pre_prod": {
          "timeout": 60,
          "memory_size": 128,
          "size": 512
        },
        "prod": {
          "timeout": 120,
          "memory_size": 256,
          "size": 512
        }
      }
  }
  
```


Ensure these variables are set before running deployment scripts.



## Local Development

For static code analysis and auto-formatting code:

```bash
make lint_all
```


For testing code:

```bash
make test
```

To run the application locally, build the Docker image and execute the container:

```bash
make run
```
Access the application in the terminal

To build and run application using Lambda:

```bash
make run_lambda
```
To test Lambda function locally:

```bash
make invoke_lambda
```


## AWS Lambda Deployment

Deploy the Hailstone Calculator AWS Lambda function using the following commands:

```bash
make build_push
```

This will build the Docker image and push it to Amazon ECR

For deploying infrastructure using Terraform, follow these steps:

To use remote backend, create an s3 bucket and dynamodb and configure in ```infra/terraform/backend.tf```

```bash
make terraform_init

make terraform_plan

make terraform_apply
```

![IaC](iac.png)


### CI/CD Pipeline

The project includes a GitHub Actions workflow for 

- linting
- testing
- publishing to a private pypi repository 
- build docker image and push to docker repository 
- deploying to aws lambda using terraform



