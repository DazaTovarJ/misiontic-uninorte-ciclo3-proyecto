from flask import Flask, render_template, redirect, json, url_for, Response, request
from flask_mysqldb import MySQL
from models.ModelCiudad import ModelCiudad
from models.ModelNacionalidades import ModelNacionalidad

from models.ModelPais import ModelPais
from models.ModelTipoDocumento import ModelTipoDocumento
from models.ModelUsuario import ModelUsuario
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

@app.route("/registro", methods= ["GET", "POST"])
def registro():
    data = request.form
    if request.method == 'POST' :
        registrar_pasajero(request.form)   
        return render_template('user_register.html', paises=[], ciudades=[], tiposDocumento=[], nacionalidades=[])

    paises = ModelPais.get_paises(db)
    ciudades = ModelCiudad.get_ciudades(db)
    tiposDocumento = ModelTipoDocumento.get_tipos_documento(db)
    nacionalidades = ModelNacionalidad.get_nacionalidades(db)
    return render_template('user_register.html', paises=paises, ciudades=ciudades, tiposDocumento=tiposDocumento, nacionalidades=nacionalidades)


def registrar_pasajero(form):
    tipo_documento = form['tipoDocumento']
    identificacion = form['numeroIdentificacion']
    nombre = form['fname']
    apellido = form['lname']
    fecha_de_nacimiento = form['fechaNacimiento']
    ciudad= form['city']
    pais = form['country']
    genero = form['genero']
    correo = form['email']
    correo_confirmacion = form['email_conf']
    contrasena= form['password']
    contrasena_confirmacion= form['password_confirm']
    telefono= form['phone']
    nacionalidad = form['nacionalidad']
    tipo_de_sangre = ''
    rol= 3 
    categoria = None
    aerolinea= None
    ModelUsuario.registrar_pasajero(db, tipo_documento, identificacion, nombre, apellido, 
                        fecha_de_nacimiento, ciudad, pais, genero, correo, contrasena, telefono, 
                        nacionalidad, tipo_de_sangre, rol, categoria, aerolinea)



@app.route('/contacto')
def contacto():
    return render_template('atencion_usuario.html')


@app.route("/reservas")
def reservas():
    return render_template('reservas.html')

def status_401(error):
    return redirect(url_for('login'))


def status_404(error):
    return "<h1>Página no encontrada</h1>", 404


"""
Rutas de api
"""

@app.route("/api/paises", methods = ['GET'])
def get_paises():
    paises = ModelPais.get_paises(db)
    return  Response(json.dumps(paises[0].__dict__), mimetype='application/json')



if __name__ == '__main__':
    app.register_error_handler(401, status_401)
    app.register_error_handler(404, status_404)
    app.run()