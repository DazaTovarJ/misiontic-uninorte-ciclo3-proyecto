# intalacion del env
## por primera vez se debe instalar el env
- py -m venv env 
## activar el env
- .\env\Scripts\activate
## instalar las librerias necesarias
```
pip install -r requirements.txt 
```


# guardar las librerias instaladas
cada vez que se instale una libreria se debe ejecutar el siguiente comando en la consola   
- pip freeze >> requirements.txt 

# ejecucion del proyecto
## ejecutar en la terminal
- set FLASK_APP=app.py
- flask run