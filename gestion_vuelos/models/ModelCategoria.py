from models.entities.Categoria import Categoria

class ModelCategoria:

    @classmethod
    def get_categorias(self, db):
        cur = db.connection.cursor()
        cur.execute('select id, categoria from categorias')
        data = cur.fetchall()
        cur.close()
        listado = []
        for row in data:
            item= Categoria(row[0], row[1])
            listado.append(item)

        return listado