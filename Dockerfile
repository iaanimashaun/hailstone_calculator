
# Dockerfile
FROM python:3.10-slim

WORKDIR /app/

# COPY src/hailstone_calculator/ .
COPY . /app

COPY requirements/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# ENTRYPOINT ["sleep", "120"]

CMD ["python", "src/main.py"]

