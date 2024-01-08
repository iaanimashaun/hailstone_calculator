import azure.functions as func

from src.api import app

app = func.AsgiFunctionApp(app=app, http_auth_level=func.AuthLevel.ANONYMOUS)
