from models.entities.Pais import Pais

class ModelPais():
    
    @classmethod
    def get_paises(self, db):
        cur = db.connection.cursor()
        cur.execute('select id, pais from paises')
        data = cur.fetchall()
        cur.close()
        paises = []
        for pais in data:
            p = Pais(pais[0], pais[1])
            paises.append(p)

        return paises