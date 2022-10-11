from gestion_vuelos.db.connection import get_connection
from gestion_vuelos.models.entities.Nacionalidad import Nacionalidad


class ModelNacionalidad:
    @classmethod
    def get_nacionalidades(cls):
        connection = get_connection()
        nacionalidades = []
        with connection.cursor() as cur:
            cur.execute('select id, nacionalidad from nacionalidades')
            data = cur.fetchall()
            for nacionalidad in data:
                p = Nacionalidad(nacionalidad[0], nacionalidad[1])
                nacionalidades.append(p)

        connection.close()
        return nacionalidades
