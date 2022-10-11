from gestion_vuelos.db.connection import get_connection
from gestion_vuelos.models.entities.Ciudad import Ciudad


class ModelCiudad():

    @classmethod
    def get_ciudades(cls):
        connection = get_connection()
        ciudades = []
        with connection.cursor() as cur:
            cur.execute(
                'select id, ciudad, pais from ciudades order by pais, ciudad')
            data = cur.fetchall()
            for ciudad in data:
                p = Ciudad(ciudad[0], ciudad[1], ciudad[2])
                ciudades.append(p)

        connection.close()
        return ciudades
