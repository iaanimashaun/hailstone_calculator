# Getting Started

## 1. Introduction

This document outlines the requirements for building, testing, and deploying the **Hailstone Calculator** project. The project utilizes a Makefile for task automation across different platforms.

## 2. Software Dependencies

The project relies on several software dependencies for development, testing, and deployment. Ensure the following tools are installed on your system:

### 2.1 Python and Pip

- **Python:** Version 3.6 or higher
- **Pip:** Python package installer

### 2.2 Docker

- **Docker:** Containerization platform

### 2.3 AWS CLI

- **AWS CLI:** Command-line interface for interacting with AWS services

### 2.4 Terraform

- **Terraform:** Infrastructure as Code (IaC) tool for provisioning and managing cloud infrastructure

### 2.5 Azure Functions Core Tools

- **Azure Functions Core Tools:** Command-line interface for creating Azure Functions 

## 3. Project Setup

To set up the project, follow these steps:

### 3.1 Clone Repository

Clone the project repository from the source.

```bash
git clone https://github.com/iaanimashaun/hailstone_calculator.git
cd hailstone_calculator
```

### 3.2 Environment Configuration

Create a .env file in the project root and define the required environment variables. An example .env file may include:

```bash
# AWS Configuration
AWS_ECR_REPO_NAME = XXXXXXX
AWS_REGION = xx-xxxx-x
AWS_ACCOUNT_ID = XXXXXXXXXXXX

# Azure Configuration
AZURE_ACR_NAME=XXXXX
AZURE_RESOURCE_GROUP=XXXXXXX
AZURE_ACR_SKU=Basic
AZURE_PORT = 7079
AZURE_ACR_NAME = XXXXXXX
```

## 3.3 Virtual Environment Setup

It is recommended to create a virtual environment to manage project dependencies. Follow these steps to set up a virtual environment using the method of your choice:


### 3.3.1 Create a Virtualenv Environment


```bash
pip install virtualenv
```

Navigate to the project directory and create a virtual environment:

```bash
cd hailstone_calculator
virtualenv venv
```

On Windows:

bash
```bash
venv\Scripts\activate
```

On Unix or MacOS:

```bash
source venv/bin/activate
```


### 3.3.2 Create a Conda Environment

Download and install Miniconda or Anaconda from [Conda's website](https://docs.conda.io/en/latest/miniconda.html).

Navigate to the project directory and create a Conda environment:

```bash
cd hailstone_calculator
conda create --name myenv python=3.8
```

Activate the Conda environment:

```bash
conda activate myenv
```

### 3.3.3 Other Options (Poetry, Pipenv)


## 4. Build and Run
The following commands can be executed using the Makefile targets:

### 4.1 Installing Dependencies

```bash
make install
```


### 4.2 Build and Run Project in Docker

```bash
make run
```

### 4.3 Build and Run AWS Lambda Function in Docker

```bash
make run_lambda
```

### 4.4 Run Azure Function Locally
```bash
make run_azure_function
```
### 4.5 Terraform Commands
Initialize Terraform backend:
```bash
make terraform_init
```
Generate and display Terraform execution plan:
```bash
make terraform_plan
```
Apply Terraform infrastructure changes:
```bash
make terraform_apply
```
### 4.6 Build Docker Image, Login, Create Repository, and Push to AWS ECR
```bash
make build_push
```
## 5. Additional Commands
### 5.1 Clean Docker Resources
Remove Docker containers and images:

```bash
make clean
```
### 5.2 Generate Terraform Documentation
Generate Markdown documentation for Terraform configurations:

```bash
make terraform_docs
```

