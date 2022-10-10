from models.entities.Ciudad import Ciudad

class ModelCiudad():
    
    @classmethod
    def get_ciudades(self, db):
        cur = db.connection.cursor()
        cur.execute('select id, ciudad, pais from ciudades order by pais, ciudad')
        data = cur.fetchall()
        cur.close()
        ciudades = []
        for ciudad in data:
            p = Ciudad(ciudad[0], ciudad[1], ciudad[2])
            ciudades.append(p)

        return ciudades