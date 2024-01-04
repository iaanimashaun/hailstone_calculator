# Dockerfile for building a Python application image

# Use an official Python runtime as a base image
FROM python:3.10-slim

# Set the working directory inside the container to /app/
WORKDIR /app/

# Copy the current directory contents into the container at /app/
COPY . /app

# Copy requirements file to the working directory
COPY requirements/requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set the default command to run when the container starts
CMD ["python", "src/main.py"]
