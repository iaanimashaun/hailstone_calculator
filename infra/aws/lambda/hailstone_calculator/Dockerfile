# Dockerfile for building a Lambda function image

# Use the official AWS Lambda Python 3.10 base image
FROM public.ecr.aws/lambda/python:3.10

# Install dependencies from a custom PyPI repository
RUN pip install --trusted-host 35.173.218.46:8081 --extra-index-url http://admin:admin@35.173.218.46:8081/repository/pypi/simple/ hailstone_calculator --target ${LAMBDA_TASK_ROOT}

# Copy your Lambda function code into the container
COPY app.py ${LAMBDA_TASK_ROOT}


# Set the command to run the Lambda function handler
CMD [ "app.lambda_handler" ]
