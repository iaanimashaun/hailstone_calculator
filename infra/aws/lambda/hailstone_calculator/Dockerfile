FROM public.ecr.aws/lambda/python:3.10

RUN pip install --trusted-host 35.173.218.46:8081 --extra-index-url http://admin:admin@http://35.173.218.46:8081/repository/pypi/simple/ hailstone_calculator --target ${LAMBDA_TASK_ROOT}


# Copy your Lambda function code
COPY app.py ${LAMBDA_TASK_ROOT}

CMD [ "app.lambda_handler" ]
