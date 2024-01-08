
# Use an official Python runtime with Alpine Linux as base image
FROM python:3.10-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY src /app/src

COPY requirements/requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available 
EXPOSE 8000

# Command to run the application
CMD ["uvicorn", "src.api:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
