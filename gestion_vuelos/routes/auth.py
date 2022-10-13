from datetime import date, datetime
from flask import Blueprint, request, session, render_template, redirect, url_for, flash, g
from werkzeug.security import generate_password_hash, check_password_hash
from werkzeug.datastructures import ImmutableMultiDict
from gestion_vuelos.models.ModelUsuario import ModelUsuario

auth = Blueprint('auth', __name__, url_prefix='/auth')


@auth.route('/login', methods=["POST"])
def login():
    email = request.form.get("email")
    password = request.form.get("password")

    if email == None:
        flash("El correo es requerido", "error")
        return redirect(request.referrer)
    elif password == None:
        flash("La contraseña es requerida", "error")
        return redirect(request.referrer)

    password = str(password)

    user = ModelUsuario.obtener_por_correo_login(email)
    if user == None:
        flash("Credenciales incorrectas", "error")
        return redirect(request.referrer)
    elif user[1] != email or not check_password_hash(user[2], password):
        flash("Credenciales incorrectas", "error")
        return redirect(request.referrer)
    else:
        session.clear()
        session["user_id"] = user[0]
        session["user_nombre"] = user[3]
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
    if not validate_register_data(request.form):
        return redirect(request.referrer)
    nombre = request.form.get("fname") or ""
    apellido = request.form.get("lname") or ""
    tipo_documento = int(request.form.get("tipoDocumento") or "")
    genero = request.form.get("genero") or ""
    identificacion = request.form.get("numeroIdentificacion") or ""
    fecha_de_nacimiento = datetime.fromisoformat(
        request.form.get("fechaNacimiento") or "")
    nacionalidad = int(request.form.get("nacionalidad") or "")
    correo = request.form.get("email") or ""
    password = generate_password_hash(request.form.get("password") or "")
    telefono = request.form.get("phone") or ""
    pais = int(request.form.get("country") or "")
    ciudad = int(request.form.get("city") or "")

    usuario = ModelUsuario.obtener_por_correo(correo)
    if usuario is None:
        ModelUsuario.agregar_usuario(tipo_documento, identificacion, nombre, apellido,
                                     fecha_de_nacimiento, ciudad, pais, genero, correo, password, telefono,
                                     nacionalidad, 3)
        flash("usuario registrado satisfactoriamente", "success")
    else:
        flash("El usuario ya existe", "error")

    return redirect(url_for("home.index"))


def validate_register_data(form: ImmutableMultiDict):
    validated = True
    if not form.get("fname"):
        flash("El nombre es requerido", "error")
        validated = False
    elif not form.get("lname"):
        flash("El apellido es requerido", "error")
        validated = False
    elif not form.get("tipoDocumento"):
        flash("El tipo de documento de identidad es requerido es requerido", "error")
        validated = False
    elif not form.get("genero"):
        flash("El género es requerido", "error")
        validated = False
    elif not form.get("numeroIdentificacion"):
        flash("El número de identificación es requerido", "error")
        validated = False
    elif not form.get("fechaNacimiento"):
        flash("La fecha de nacimiento es requerida", "error")
        validated = False
    elif not form.get("nacionalidad"):
        flash("La nacionalidad es requerida", "error")
        validated = False
    elif not form.get("email"):
        flash("El correo es requerido", "error")
        validated = False
    elif not form.get("email_confirm"):
        flash("Debe escribir nuevamente su correo", "error")
        validated = False
    elif form.get("email") != form.get("email_confirm"):
        flash("Los correos no coinciden", "error")
        validated = False
    elif not form.get("password"):
        flash("La contraseña es requerida", "error")
        validated = False
    elif not form.get("password_confirm"):
        flash("Debe escribir nuevamente su contraseña", "error")
        validated = False
    elif form.get("password") != form.get("password_confirm"):
        flash("Las contraseñas no coinciden", "error")
        validated = False
    elif not form.get("phone"):
        flash("El teléfono de contacto es requerido", "error")
        validated = False
    elif not form.get("address"):
        flash("La dirección es requerida", "error")
        validated = False
    elif not form.get("country"):
        flash("El país es requerido", "error")
        validated = False
    elif not form.get("city"):
        flash("La ciudad es requerida", "error")
        validated = False
    elif not form.get("contact"):
        flash("El nombre del contacto de emergencia es requerido", "error")
        validated = False
    elif not form.get("n_contact"):
        flash("El teléfono del contacto de emergencia es requerido", "error")
        validated = False
    elif not form.get("aceptar_politicas"):
        flash("Debe aceptar las políticas de privacidad", "error")
        validated = False
    return validated


@auth.route('/logout', methods=["GET"])
def logout():
    session.clear()
    return redirect(url_for("home.index"))


@auth.before_app_request
def load_logged_in_user():
    if session:
        user_id = session.get('user_id')
        if user_id is None:
            g.user = None
        else:
            g.user = ModelUsuario.obtener(user_id)
