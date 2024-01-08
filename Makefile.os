
# Detect the operating system
ifeq ($(OS),Windows_NT)
    # Windows platform
    RM = del 
    MKDIR = mkdir
    COPY_CMD = copy
    FUNC_START_CMD = func start --p $(AZURE_PORT)
	TERRAFORM_PLAN_CMD = cd $(TERRAFORM_DIR) && \
                        set CURRENT_TERRAFORM_WORKSPACE=$$(terraform workspace show) && \
                        set VAR_FILE=%CURRENT_TERRAFORM_WORKSPACE%.tfvars && \
                        terraform fmt && \
                        terraform validate && \
                        terraform plan -var-file=%VAR_FILE%
	 
	TERRAFORM_APPLY_CMD = cd $(TERRAFORM_DIR) && \
                        for /f "delims=" %%i in ('terraform workspace show') do set CURRENT_TERRAFORM_WORKSPACE=%%i && \
                        echo workspace is %CURRENT_TERRAFORM_WORKSPACE% && \
                        set VAR_FILE=%CURRENT_TERRAFORM_WORKSPACE%.tfvars && \
                        echo Using variable file: %VAR_FILE% && \
                        terraform fmt && \
                        terraform validate && \
                        terraform apply -var-file=%VAR_FILE% --auto-approve
else
    # Linux and macOS platforms
    RM = rm -f
    MKDIR = mkdir -p
	COPY_CMD = cp -r
    FUNC_START_CMD = func start -p $(AZURE_PORT)
    TERRAFORM_PLAN_CMD =    cd $(TERRAFORM_DIR) && \
                            CURRENT_TERRAFORM_WORKSPACE=$$(terraform workspace show) && \
                            echo "workspace is $$CURRENT_TERRAFORM_WORKSPACE" && \
                            VAR_FILE="$${CURRENT_TERRAFORM_WORKSPACE}.tfvars" && \
                            echo "Using variable file: $$VAR_FILE" && \
                            terraform fmt && \
                            terraform validate && \
                            terraform plan -var-file=$$VAR_FILE
	TERRAFORM_APPLY_CMD =   cd $(TERRAFORM_DIR) && \
                         	CURRENT_TERRAFORM_WORKSPACE=$$(terraform workspace show) && \
                         	echo "workspace is $$CURRENT_TERRAFORM_WORKSPACE" && \
                         	VAR_FILE="$${CURRENT_TERRAFORM_WORKSPACE}.tfvars" && \
                         	echo "Using variable file: $$VAR_FILE" && \
                            terraform fmt && \
                            terraform validate && \
                         	terraform apply -var-file=$$VAR_FILE --auto-approve

endif





# Docker Configuration
DOCKER_IMAGE_NAME = hailstone_calculator
DOCKER_IMAGE_TAG = latest
LAMBDA_DOCKERFILE = infra/aws/lambda/hailstone_calculator/Dockerfile
AZURE_FUNCTION_DOCKERFILE_PATH = infra/azure/Dockerfile
AZURE_FUNCTION_DOCKERFILE_FOLDER = infra/azure
DOCKER_BUILD_CMD = docker build -t $(DOCKER_IMAGE_NAME)
DOCKER_RUN_CMD = docker run -it --rm
AWS_ECR_REPO_URI = $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(AWS_ECR_REPO_NAME)
DOCKER_AWS_TAG_CMD = docker tag $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) $(AWS_ECR_REPO_URI):$(DOCKER_IMAGE_TAG)
DOCKER_AWS_LOGIN_CMD = aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(AWS_ECR_REPO_URI)
DOCKER_AWS_PUSH_CMD = docker push $(AWS_ECR_REPO_URI):$(DOCKER_IMAGE_TAG)
DOCKER_BUILD_PUSH_CMD_AZURE = az acr build --image $(DOCKER_IMAGE_NAME) --registry $(AZURE_ACR_NAME) --file $(AZURE_FUNCTION_DOCKERFILE_PATH) $(AZURE_FUNCTION_DOCKERFILE_FOLDER)



# Source and Directory Configuration
SRC_DIR = src
LAMBDA_FUNCTION_DIR = infra/aws/lambda/hailstone_calculator
AZURE_FUNCTION_DIR = infra/azure
TERRAFORM_DIR = infra/terraform



STARTING_NUMBER = 12


