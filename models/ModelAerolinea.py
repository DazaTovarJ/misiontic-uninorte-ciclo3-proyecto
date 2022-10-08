from models.entities.Aerolinea import Aerolinea

class ModelAerolinea:
    @classmethod
    def get_aerolineas(self, db):
        cur = db.connection.cursor()
        cur.execute('select id, aerolinea from aerolineas')
        data = cur.fetchall()
        cur.close()
        listado = []
        for row in data:
            item= Aerolinea(row[0], row[1])
            listado.append(item)

        return listado
