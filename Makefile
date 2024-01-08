# Configuration
ENV_FILE := .env
include $(ENV_FILE)
include Makefile.os

# Phony Targets
.PHONY: install install_linting_dependencies install_test_dependencies \
        lint lint_fix lint_all test coverage test_cov \
        run run_lambda invoke_lambda run_azure_function invoke_azure_function \
        terraform_init terraform_plan terraform_apply terraform_all \
        build_push build login create_repo push clean


# Installation Targets
install:
	# Upgrade pip and install project dependencies
	pip install --upgrade pip
	pip install -r requirements/requirements.txt

install_linting_dependencies:
	# Install dependencies for linting
	pip install --upgrade pip
	pip install -r requirements/typing_requirements.txt

install_test_dependencies:
	# Install dependencies for testing
	pip install --upgrade pip
	pip install -r requirements/test_requirements.txt



# Linting Targets
lint:
	# Run mypy and flake8 for static code analysis
	mypy $(SRC_DIR)
	flake8 $(SRC_DIR)
	pylint $(SRC_DIR)

lint_fix:
	# Auto-format code using black and isort
	black $(SRC_DIR)
	isort $(SRC_DIR)

lint_all: lint lint_fix



# Testing Targets
test:
	# Run tests using pytest
	pytest -v

coverage:
	# Run tests with coverage
	pytest --cov=$(SRC_DIR)

test_cov: test coverage



# Docker Targets
run:
	# Build and run the project in a Docker container
	$(DOCKER_BUILD_CMD) .
	$(DOCKER_RUN_CMD) $(DOCKER_IMAGE_NAME)

run_lambda:
	# Build and run AWS Lambda function in a Docker container
	$(DOCKER_BUILD_CMD) -f $(LAMBDA_DOCKERFILE) .
	$(DOCKER_RUN_CMD) -p 9090:8080 $(DOCKER_IMAGE_NAME)

invoke_lambda:
	@curl \
	-H "Content-Type: application/json" \
	-d '{"version": "2.0", "requestContext": {"http": {"sourceIp": "192.0.0.1", "path": "/hailstone", "method": "GET"}}, "rawQueryString": "starting_number=$(STARTING_NUMBER)"}' \
	http://localhost:9090/2015-03-31/functions/function/invocations

run_azure_function:
	# Copy source code to Azure Function directory
	$(COPY_CMD) $(SRC_DIR) $(AZURE_FUNCTION_DIR)/
	# Start Azure Function
	cd $(AZURE_FUNCTION_DIR) && $(FUNC_START_CMD)

invoke_azure_function:
	@curl "http://localhost:$(AZURE_PORT)/hailstone?starting_number=$(STARTING_NUMBER)"



# Terraform Targets
terraform_init:
	# Initialize backend
	cd $(TERRAFORM_DIR) && terraform init

terraform_plan:
	# Generate and display Terraform execution plan
	$(TERRAFORM_PLAN_CMD)

terraform_apply:
	# Apply Terraform infrastructure changes
	$(TERRAFORM_APPLY_CMD)

terraform_docs:
	terraform-docs markdown $(TERRAFORM_DIR) > docs/Deployment/terraform.md

terraform_all: terraform_init terraform_plan terraform_apply



# Docker Image Targets

# Build and Push Docker Image to AWS ECR
build_push_aws: build_aws login_aws create_repo_aws push_aws

build_aws:
	# Build Docker image for AWS ECR
	$(DOCKER_BUILD_CMD) -f $(LAMBDA_DOCKERFILE) . > build_errors.txt 2>&1

login_aws:
	# Login to AWS ECR registry
	$(DOCKER_AWS_LOGIN_CMD)

create_repo_aws:
	# Create AWS ECR repository if not exists
	aws ecr describe-repositories --repository-names $(AWS_ECR_REPO_NAME) || \
	aws ecr create-repository --repository-name $(AWS_ECR_REPO_NAME) --region $(AWS_REGION)

push_aws:
	# Tag and push Docker image to AWS ECR
	$(DOCKER_AWS_TAG_CMD)
	$(DOCKER_AWS_PUSH_CMD)



# Build and Push Docker Image to Azure Container Registry
# build_push_azure: create_repo_azure build_push_azure

create_repo_azure:
	# Create Azure Container Registry if not exists
	az acr show --name $(AZURE_ACR_NAME) || \
	az acr create --resource-group $(AZURE_RESOURCE_GROUP) --name $(AZURE_ACR_NAME) --sku $(AZURE_ACR_SKU)

build_push_azure: 
	# Tag and push Docker image to Azure Container Registry
	$(COPY_CMD) $(SRC_DIR) $(AZURE_FUNCTION_DIR)/
	$(COPY_CMD) requirements/requirements.txt $(AZURE_FUNCTION_DIR)/
	$(DOCKER_BUILD_PUSH_CMD_AZURE)



clean:
	@docker rm -f $$(docker ps -aq)
	@docker rmi -f $$(docker images -aq)
















