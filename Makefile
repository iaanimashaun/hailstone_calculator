# Set the default environment to 'dev'
ENV_FILE := .env

# Load environment variables from the selected .env file
include $(ENV_FILE)

.PHONY: install lint test coverage build_publish_pypi run run_lambda invoke_lambda_args terraform_apply terraform_plan all

install:
	pip install --upgrade pip
	pip install -r requirements.txt

install_linting_dependencies:
	pip install --upgrade pip
	pip install -r requirements/typing_requirements.txt

install_test_dependencies:
	pip install --upgrade pip
	pip install -r requirements/test_requirements.txt

lint:
	mypy src
	flake8 src

lint_fix:
	black src
	isort src

lint_all: lint lint_fix

test:
	pytest

coverage:
	pytest --cov=src

test_cov: test coverage

SRC_DIR := /home/ubuntu/projects/hailstone/src

build_publish_pypi:
	cd $(SRC_DIR) && rm -rf dist/ && python setup.py sdist && \
	twine upload -r nexus dist/*

run:
	docker build -t hailstone_calculator . > logs/build_errors.txt 2>&1
	docker run -it --rm hailstone_calculator

LAMBDA_FUNCTION_DIR := /home/ubuntu/projects/hailstone/infra/aws/lambda/hailstone_calculator
LOG_DIR := /home/ubuntu/projects/hailstone/logs

run_lambda:
	cd $(LAMBDA_FUNCTION_DIR) && docker build --rm -t hailstone_calculator:test . > $(LOG_DIR)/build_errors.txt 2>&1 
	docker run --platform linux/amd64 -p 9000:8080 hailstone_calculator:test

LAMBDA_ARGS='{"starting_number": 7}'

invoke_lambda_args:
	curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d $(LAMBDA_ARGS)

TERRAFORM_DIR := /home/ubuntu/projects/hailstone/infra/terraform

terraform_apply:
	cd $(TERRAFORM_DIR) && terraform apply --auto-approve

terraform_plan:
	cd $(TERRAFORM_DIR) && terraform plan

all: lint-all test-cov run

DOCKER_IMAGE_NAME := hailstone_calculator

build_push: build login create_repo push

build:
	cd $(LAMBDA_FUNCTION_DIR) && docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) . > $(LOG_DIR)/build_errors.txt 2>&1

login:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

create_repo:
	aws ecr describe-repositories --repository-names $(AWS_ECR_REPO_NAME) >/dev/null 2>&1 || \
		aws ecr create-repository --repository-name $(AWS_ECR_REPO_NAME) --region $(AWS_REGION) >/dev/null

push:
	docker tag $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) $(AWS_ECR_REPO_URI):$(DOCKER_IMAGE_TAG)
	docker push $(AWS_ECR_REPO_URI):$(DOCKER_IMAGE_TAG)




























# # Set the default environment to 'dev'
# ENV_FILE := .env

# # Load environment variables from the selected .env file
# include $(ENV_FILE)



# .PHONY: run install test


# install:
# 	pip install --upgrade pip
# 	pip install -r requirements.txt


# install_linting_dependencies:
# 	pip install --upgrade pip
# 	pip install -r requirements/typing_requirements.txt

# install_test_dependencies:
# 	pip install --upgrade pip
# 	pip install -r requirements/test_requirements.txt

# lint: 
# 	mypy src
# 	flake8 src


# lint_fix: 
# 	black src
# 	isort src


# lint_all: lint lint_fix

# test: 
# 	pytest

# coverage: 
# 	pytest --cov=src 

# test_cov: test coverage

# SRC_DIR := /home/ubuntu/projects/hailstone/src

# # build_publish_pypi: lint_all test_cov
# build_publish_pypi:
# 	cd $(SRC_DIR) && rm -rf dist/ && python setup.py sdist && \
# 	twine upload -r pypi dist/*

# run:
# 	docker build -t hailstone_calculator . > logs/build_errors.txt 2>&1
# 	docker run -it --rm hailstone_calculator


# LAMBDA_FUNCTION_DIR := /home/ubuntu/projects/hailstone/infra/aws/lambda/hailstone_calculator
# LOG_DIR := /home/ubuntu/projects/hailstone/logs


# run_lambda:  
# 	cd $(LAMBDA_FUNCTION_DIR) && docker build --rm -t hailstone_calculator:test . > $(LOG_DIR)/build_errors.txt 2>&1 
# 	docker run --platform linux/amd64 -p 9000:8080 hailstone_calculator:test



# # Define your arguments as a JSON string
# LAMBDA_ARGS='{"starting_number": 7}'

# invoke_lambda_args:
# 	curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d $(LAMBDA_ARGS)


# TERRAFORM_DIR := /home/ubuntu/projects/hailstone/infra/terraform

# terraform_apply:
# 	cd $(TERRAFORM_DIR) && terraform apply --auto-approve


# terraform_plan:
# 	cd $(TERRAFORM_DIR) && terraform plan



# all: lint_all test_cov run

# DOCKER_IMAGE_NAME := hailstone_calculator

# build_push: build login create-repo push 

# build:
# 	cd $(LAMBDA_FUNCTION_DIR) && docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) . > $(LOG_DIR)/build_errors.txt 2>&1

# login:
# 	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

# create-repo:
# 	aws ecr describe-repositories --repository-names $(AWS_ECR_REPO_NAME) >/dev/null 2>&1 || \
# 		aws ecr create-repository --repository-name $(AWS_ECR_REPO_NAME) --region $(AWS_REGION) >/dev/null

# push:
# 	docker tag $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) $(AWS_ECR_REPO_URI):$(DOCKER_IMAGE_TAG)
# 	docker push $(AWS_ECR_REPO_URI):$(DOCKER_IMAGE_TAG)





