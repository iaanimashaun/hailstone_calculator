# Makefile for managing project tasks

# Configuration
ENV_FILE := .env

# Load environment variables from the selected .env file
include $(ENV_FILE)

# Targets for setting up and installing dependencies

.PHONY: install install_linting_dependencies install_test_dependencies

install:
	# Upgrade pip and install project dependencies
	pip install --upgrade pip
	pip install -r requirements.txt

install_linting_dependencies:
	# Install dependencies for linting
	pip install --upgrade pip
	pip install -r requirements/typing_requirements.txt

install_test_dependencies:
	# Install dependencies for testing
	pip install --upgrade pip
	pip install -r requirements/test_requirements.txt

# Targets for code linting

.PHONY: lint lint_fix lint_all

lint:
	# Run mypy and flake8 for static code analysis
	mypy src
	flake8 src

lint_fix:
	# Auto-format code using black and isort
	black src
	isort src

lint_all: lint lint_fix

# Targets for testing

.PHONY: test coverage test_cov

test:
	# Run tests using pytest
	pytest

coverage:
	# Run tests with coverage
	pytest --cov=src

test_cov: test coverage

# Targets for building and publishing to PyPI

.PHONY: build_publish_pypi

build_publish_pypi:
	# Build and publish project to PyPI
	cd $(SRC_DIR) && rm -rf dist/ && python setup.py sdist && \
	twine upload -r nexus dist/*

# Targets for running the project

.PHONY: run

run:
	# Build and run the project in a Docker container
	docker build -t hailstone_calculator . > logs/build_errors.txt 2>&1
	docker run -it --rm hailstone_calculator

# Targets for running AWS Lambda functions

.PHONY: run_lambda invoke_lambda

run_lambda:
	# Build and run AWS Lambda function in a Docker container
	cd $(LAMBDA_FUNCTION_DIR) && docker build --rm -t hailstone_calculator:test . > build_errors.txt 2>&1 
	docker run --platform linux/amd64 -p 9000:8080 hailstone_calculator:test

LAMBDA_ARGS='{"starting_number": 7}'

invoke_lambda:
	# Invoke AWS Lambda function with specified arguments
	curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d $(LAMBDA_ARGS)

# Targets for managing Terraform infrastructure

.PHONY: terraform_apply terraform_plan

terraform_apply:
	# Apply Terraform infrastructure changes
	cd $(TERRAFORM_DIR) && terraform apply --auto-approve

terraform_plan:
	# Generate and display Terraform execution plan
	cd $(TERRAFORM_DIR) && terraform plan


.PHONY: all

all: lint_all test_cov run

# Targets for building, logging in, creating repository, and pushing Docker image to AWS ECR

.PHONY: build_push build login create_repo push

build_push: build login create_repo push

build:
	# Build Docker image for AWS ECR
	cd $(LAMBDA_FUNCTION_DIR) && docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) . > build_errors.txt 2>&1

login:
	# Login to AWS ECR registry
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

create_repo:
	# Create AWS ECR repository if not exists
	aws ecr describe-repositories --repository-names $(AWS_ECR_REPO_NAME) >/dev/null 2>&1 || \
		aws ecr create-repository --repository-name $(AWS_ECR_REPO_NAME) --region $(AWS_REGION) >/dev/null

push:
	# Tag and push Docker image to AWS ECR
	docker tag $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) $(AWS_ECR_REPO_URI):$(DOCKER_IMAGE_TAG)
	docker push $(AWS_ECR_REPO_URI):$(DOCKER_IMAGE_TAG)
