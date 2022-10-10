from datetime import date


class ModelUsuario:
    @classmethod
    def registrar_pasajero(self, db, tipo_documento: int, identificacion: str, nombre: str, apellido: str, 
                        fecha_de_nacimiento: date, ciudad: int, pais: int, genero:str, correo:str, contrasena:str, telefono:str, 
                        nacionalidad:int, tipo_de_sangre: str, rol:int, categoria:int, aerolinea:int
    ):
        connection = db.connection
        cursor = connection.cursor()
        query = """insert into usuarios (tipo_documento, identificacion, nombre, apellido, 
                        fecha_de_nacimiento, ciudad, pais, genero, correo, contrasena, telefono, 
                        nacionalidad, tipo_de_sangre, rol, categoria, aerolinea)
                        value( %s, %s, %s, %s, 
                        %s, %s, %s, %s, %s, %s, %s, 
                        %s, %s, %s, %s, %s)
                      """
        info = (tipo_documento, identificacion, nombre, apellido, 
                        fecha_de_nacimiento, ciudad, pais, genero, correo, contrasena, telefono, 
                        nacionalidad, tipo_de_sangre, rol, categoria, aerolinea)
        cursor.execute(query, info)
        connection.commit()
        cursor.close()

        return True