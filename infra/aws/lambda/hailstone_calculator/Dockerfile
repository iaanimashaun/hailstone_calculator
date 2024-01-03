FROM public.ecr.aws/lambda/python:3.10

RUN pip install hailstone_calculator --target ${LAMBDA_TASK_ROOT}

# Copy your Lambda function code
COPY app.py ${LAMBDA_TASK_ROOT}

CMD [ "app.lambda_handler" ]
