from flask import Flask
from gestion_vuelos.routes.home import home
from gestion_vuelos.routes.auth import auth

app = Flask(__name__)

app.config.from_object('config.DevelopmentConfig')

app.register_blueprint(home)
app.add_url_rule("/", endpoint="index")

app.register_blueprint(auth)
