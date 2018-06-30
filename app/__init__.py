from flask import Flask
from config import app_config

app = Flask(__name__)
app.config.from_object('app.config')

from views import create_app
