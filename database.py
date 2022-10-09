from flask_mysqldb import MySQL

from models.entities.Pais import Pais

class Database():
    def __init__(self, app):
        self.mysql =  MySQL(app)
    
    def tipos_documento(self):
        cur = self.mysql.connection.cursor()
        cur.execute('select * from tipos_de_documentos')
        data = cur.fetchall()
        cur.close()
        return data
    
    def get_nacionalidades(self):
        cur = self.mysql.connection.cursor()
        cur.execute('select id, nacionalidad from nacionalidades')
        data = cur.fetchall()
        cur.close()
        return data

    def get_paises(self):
        cur = self.mysql.connection.cursor()
        cur.execute('select id, pais from paises')
        data = cur.fetchall()
        cur.close()
        return data

    def get_ciudades(self):
        cur = self.mysql.connection.cursor()
        cur.execute('select id, ciudad from ciudades')
        data = cur.fetchall()
        cur.close()
        return data


    

    

