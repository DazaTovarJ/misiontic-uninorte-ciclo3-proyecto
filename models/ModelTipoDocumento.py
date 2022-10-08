from models.entities.TipoDocumento import TipoDocumento


class ModelTipoDocumento:
    @classmethod
    def get_tipos_documento(self, db):
        cur = db.connection.cursor()
        cur.execute('select id, abreviatura, nombre from tipos_de_documentos')
        data = cur.fetchall()
        cur.close()
        listado = []
        for row in data:
            item= TipoDocumento(row[0], row[1], row[2])
            listado.append(item)

        return listado