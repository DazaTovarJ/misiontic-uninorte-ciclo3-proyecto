from models.entities.Avion import Avion


class ModelAvion:

    @classmethod
    def get_aviones(self, db):
        cur = db.connection.cursor()
        cur.execute('select id, avion, modelo, capacidad, matricula, numero_de_silla, aerolineas_id from aviones')
        data = cur.fetchall()
        cur.close()
        listado = []
        for row in data:
            item= Avion(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            listado.append(item)

        return listado