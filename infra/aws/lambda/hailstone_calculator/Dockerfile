
# Dockerfile for building a Lambda function image

# Use the official AWS Lambda Python 3.10 base image
FROM public.ecr.aws/lambda/python:3.10

# Set the working directory in the container
WORKDIR /app

COPY src/ ${LAMBDA_TASK_ROOT}/src

COPY requirements/requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

# Copy your Lambda function code into the container
COPY infra/aws/lambda/hailstone_calculator/  ${LAMBDA_TASK_ROOT}

# Set the command to run the Lambda function handler
CMD [ "lambda_handler.handler" ]
