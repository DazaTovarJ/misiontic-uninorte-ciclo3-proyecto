from models.entities.Nacionalidad import Nacionalidad


class ModelNacionalidad:
    @classmethod
    def get_nacionalidades(self, db):
        cur = db.connection.cursor()
        cur.execute('select id, nacionalidad from nacionalidades')
        data = cur.fetchall()
        cur.close()
        nacionalidades = []
        for nacionalidad in data:
            p = Nacionalidad(nacionalidad[0], nacionalidad[1])
            nacionalidades.append(p)

        return nacionalidades