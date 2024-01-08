
FROM mcr.microsoft.com/azure-functions/python:4-python3.10

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY src/ /home/site/wwwroot

COPY . /home/site/wwwroot

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt



