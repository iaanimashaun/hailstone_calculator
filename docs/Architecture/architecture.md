# Architecture Documentation

This document provides an overview of the architecture of the Hailstone Calculator project.

## Overview

The project consists of the following components:

- **HailstoneCalculator Class:** Python class responsible for calculating Hailstone sequences.
- **Dockerfile:** Defines the Docker image for the Hailstone Calculator application.
- **AWS Lambda Function:** Serverless function for executing Hailstone calculations.

## File Structure

- **src/:** Contains the source code for the HailstoneCalculator class.
- **docs/:** Includes the AWS Lambda function code.
- **infra/:** Includes the AWS Lambda function code.
- **notebooks/:** Includes the AWS Lambda function code.
- **requirements/:** Includes the AWS Lambda function code.
- **src/:** Includes the AWS Lambda function code.
- **test/:** Includes the AWS Lambda function code.
- **Dockerfile:** Specifies the Docker image configuration.


## Dependencies

- Python 3.10
- AWS CLI for deployment
- Docker for containerization
- Additional dependencies listed in requirements.txt

## Workflow

The typical workflow involves building the Docker image, running the application locally, and deploying the AWS Lambda function.


![Hailstone Calculator CICD](cicd1.png)