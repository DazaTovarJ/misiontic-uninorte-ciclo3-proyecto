from flask import Blueprint, render_template, session

from gestion_vuelos.models.ModelPais import ModelPais
from gestion_vuelos.models.ModelCiudad import ModelCiudad
from gestion_vuelos.models.ModelTipoDocumento import ModelTipoDocumento
from gestion_vuelos.models.ModelNacionalidades import ModelNacionalidad

home = Blueprint('home', __name__)


@home.route('/')
def index():
    return render_template('index.html')


@home.route('/conocenos')
def about():
    return render_template('about.html')


@home.route('/destinos')
def travel():
    return render_template('travel.html')


@home.route("/reservas")
def reservas():
    return render_template('reservas.html')


@home.route("/ofertas")
def ofertas():
    return render_template('ofertas.html')


@home.route("/registro")
def registro():
    nombre = session.get("nombre") or ""
    apellido = session.get("apellido") or ""
    email = session.get("email", "") or ""
    password = session.get("password") or ""
    paises = ModelPais.get_paises()
    ciudades = ModelCiudad.get_ciudades()
    tiposDocumento = ModelTipoDocumento.get_tipos_documento()
    nacionalidades = ModelNacionalidad.get_nacionalidades()
    session.clear()
    return render_template('user_register.html', nombre=nombre, apellido=apellido, email=email, password=password, paises=paises, ciudades=ciudades, tiposDocumento=tiposDocumento, nacionalidades=nacionalidades)


@home.route('/contacto')
def contacto():
    return render_template('atencion_usuario.html')
