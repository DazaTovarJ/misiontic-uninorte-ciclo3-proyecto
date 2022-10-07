from flask import Flask, render_template

app = Flask(__name__)


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


