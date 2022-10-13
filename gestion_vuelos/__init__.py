from flask import Flask, redirect, url_for
from gestion_vuelos.routes.home import home
from gestion_vuelos.routes.auth import auth

app = Flask(__name__)

app.config.from_object('config.DevelopmentConfig')

app.register_blueprint(home)
app.add_url_rule("/", endpoint="index")

app.register_blueprint(auth)


def status_401(error):
    return redirect(url_for('login'))


def status_404(error):
    return "<h1>Página no encontrada</h1>", 404


app.register_error_handler(401, status_401)
app.register_error_handler(404, status_404)
