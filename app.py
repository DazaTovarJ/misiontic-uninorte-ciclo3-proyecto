from urllib import request
from flask import Flask, render_template, json, jsonify, Response
from flask_mysqldb import MySQL
from models.ModelNacionalidades import ModelNacionalidad

from models.ModelPais import ModelPais
app = Flask(__name__) 

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'example'
app.config['MYSQL_DB'] = 'gestion_vuelos'
db =  MySQL(app)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/conocenos')
def about():
    return render_template('about.html')


@app.route('/destinos')
def travel():
    return render_template('travel.html')

@app.route("/ofertas")
def ofertas():
    return render_template('ofertas.html')

@app.route("/registro")
def registro():
    return render_template('user_register.html')


@app.route('/contacto')
def contacto():
    return render_template('atencion_usuario.html')


@app.route("/reservas")
def reservas():
    return render_template('reservas.html')


"""
Rutas de api
"""

@app.route("/api/paises", methods = ['GET'])
def get_paises():
    paises = ModelPais.get_paises(db)
    return  Response(json.dumps(paises[0].__dict__), mimetype='application/json')