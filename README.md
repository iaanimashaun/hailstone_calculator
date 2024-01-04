# Hailstone Calculator

This repository contains the source code and deployment scripts for the Hailstone Calculator project.

## Overview

The Hailstone Calculator is a Python application that calculates the Hailstone sequence for a given starting number. It includes Docker containerization, AWS Lambda deployment, and Terraform infrastructure deployment.

## Getting Started

The following documents provide step-by-step instructions:

- [Architecture Documentation](./docs/Architecture/architecture.md)
- [Dependencies Documentation](./docs/Dependencies/dependencies.md)
- [Deployment Documentation](./docs/Deployment/deployment.md)

## Local Development

- Build and run the Docker container locally using `make run`.
- Access the application in the terminal.


- Build and run the lambda function locally using `make run_lambda`.
- Test application using `make invoke_lambda`

## AWS Lambda Deployment

- Deploy the AWS Lambda function using `make build_push` then `make terraform_apply`.
- Configure necessary environment variables in the `.env` file.
- Ensure AWS credentials are configured.



