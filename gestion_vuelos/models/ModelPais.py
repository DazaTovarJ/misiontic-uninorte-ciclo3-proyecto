from gestion_vuelos.models.entities.Pais import Pais
from gestion_vuelos.db.connection import get_connection


class ModelPais():

    @classmethod
    def get_paises(cls):
        connection = get_connection()
        paises = []
        with connection.cursor() as cur:
            cur.execute('select id, pais from paises')
            data = cur.fetchall()
            for pais in data:
                p = Pais(pais[0], pais[1])
                paises.append(p)

        connection.close()
        return paises
