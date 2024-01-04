# Dependencies Documentation

This document outlines the dependencies required for the Hailstone Calculator project.

## Linting Dependencies

- **mypy:** Type checking for Python.
- **flake8:** Linting tool for Python.
- **black:** Code formatter.
- **isort:** Import sorter.

Install these dependencies using the following command:

```bash
make install_linting_dependencies
```

## Testing Dependencies

- **pytest:** Testing framework.

Install testing dependencies using:

```
make install_test_dependencies
```

## AWS Lambda Deployment Dependencies


- **AWS CLI:** Required for deploying the AWS Lambda function.
Ensure you have configured the AWS CLI with the necessary credentials..
- **Terraform:** Infrastructure as Code tool for deploying AWS resources.
Install Terraform using your preferred package manager.



