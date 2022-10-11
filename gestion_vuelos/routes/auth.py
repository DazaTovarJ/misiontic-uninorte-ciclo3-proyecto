from datetime import datetime
from flask import Blueprint, request, session, render_template, redirect, url_for, flash, g
from werkzeug.security import generate_password_hash, check_password_hash
from gestion_vuelos.models.ModelUsuario import ModelUsuario

auth = Blueprint('auth', __name__, url_prefix='/auth')


@auth.route('/login', methods=["POST"])
def login():
    email = request.form.get("email")
    password = request.form.get("password")

    if email == None:
        flash("El correo es requerido", "error")
    elif password == None:
        flash("La contraseña es requerida", "error")

    password = str(password)

    user = ModelUsuario.obtener_por_correo_y_contrasena(email, password)
    if user == None:
        flash("Credenciales incorrectas", "error")
    elif user[1] != email or not check_password_hash(user[2], password):
        flash("Credenciales incorrectas", "error")
    else:
        session.clear()
        session["user_id"] = user[0]

    return redirect(url_for("home.index"))


@auth.route('/registro/inicial', methods=["POST"])
def registro_inicial():
    session["nombre"] = request.form.get("nombre")
    session["apellido"] = request.form.get("apellido")
    session["email"] = request.form.get("email")
    session["password"] = request.form.get("password")
    return redirect(url_for("home.registro"))


@auth.route("/register", methods=["POST"])
def register():
    nombre = request.form.get("fname", "")
    apellido = request.form.get("lname", "")
    tipo_documento = int(request.form.get("tipoDocumento", ""))
    genero = request.form.get("genero", "")
    identificacion = request.form.get("numeroIdentificacion", "")
    fecha_de_nacimiento = datetime.fromisoformat(
        request.form.get("fechaNacimiento", ""))
    nacionalidad = int(request.form.get("nacionalidad", ""))
    correo = request.form.get("email", "")
    email_confirm = request.form.get("email_confirm", correo)
    password = request.form.get("password", "")
    password_confirm = request.form.get("password_confirm", password)
    telefono = request.form.get("phone", "")
    address = request.form.get("address")
    pais = int(request.form.get("country", ""))
    ciudad = int(request.form.get("city", ""))
    contact = request.form.get("contact")
    n_contact = request.form.get("n_contact")
    aceptar_politicas = request.form.get("aceptar_politicas")
    usuario = ModelUsuario.obtener_por_correo(correo)
    if usuario is None:
        ModelUsuario.agregar_usuario(tipo_documento, identificacion, nombre, apellido,
                                     fecha_de_nacimiento, ciudad, pais, genero, correo, password, telefono,
                                     nacionalidad, 3)
        flash("usuario registrado satisfactoriamente", "success")
    else:
        flash("El usuario ya existe", "error")

    return redirect(url_for("home.index"))


@auth.route('/logout', methods=["POST"])
def logout():
    return redirect(url_for("home.index"))


@auth.before_app_request
def load_logged_in_user():
    user_id = session.get('user_id')

    if user_id is None:
        g.user = None
    else:
        g.user = ModelUsuario.obtener(user_id)
