from datetime import date
from gestion_vuelos.db.connection import get_connection


class ModelUsuario:
    @classmethod
    def obtener(cls, id):
        conn = get_connection()
        user = None
        with conn.cursor() as cur:
            query = "select * from usuarios where id = %d AND estado = 1"
            info = (id)
            cur.execute(query, info)
            user = cur.fetchone()

        conn.close()
        print(user)
        return user

    @classmethod
    def obtener_por_correo(cls, correo):
        conn = get_connection()
        user = None
        with conn.cursor() as cur:
            query = "select * from usuarios where correo = %s AND estado = 1"
            info = (correo)
            cur.execute(query, info)
            user = cur.fetchone()

        conn.close()
        print(user)
        return user

    @classmethod
    def obtener_por_correo_y_contrasena(cls, correo, contrasena):
        conn = get_connection()
        user = None
        with conn.cursor() as cur:
            query = """select id, correo, contrasena, nombre, apellido from usuarios where correo = %s AND contrasena = %s AND estado = 1"""
            info = (correo, contrasena)
            cur.execute(query, info)
            user = cur.fetchone()
        conn.close()
        return user

    @classmethod
    def agregar_usuario(cls, tipo_documento: int, identificacion: str, nombre: str, apellido: str,
                        fecha_de_nacimiento: date, ciudad: int, pais: int, genero: str, correo: str, contrasena: str, telefono: str,
                        nacionalidad: int, rol: int,
                        ):
        connection = get_connection()
        with connection.cursor() as cursor:
            query = """insert into usuarios (tipo_documento, identificacion, nombre, apellido,
                            fecha_de_nacimiento, ciudad, pais, genero, correo, contrasena, telefono,
                            nacionalidad, rol)
                            value( %s, %s, %s, %s,
                            %s, %s, %s, %s, %s, %s, %s,
                            %s, %s)
                        """
            info = (tipo_documento, identificacion, nombre, apellido,
                    fecha_de_nacimiento, ciudad, pais, genero, correo, contrasena, telefono,
                    nacionalidad, rol)
            cursor.execute(query, info)

        connection.commit()
        connection.close()

        return True
