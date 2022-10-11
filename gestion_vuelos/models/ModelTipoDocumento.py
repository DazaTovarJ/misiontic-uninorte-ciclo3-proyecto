from gestion_vuelos.db.connection import get_connection
from gestion_vuelos.models.entities.TipoDocumento import TipoDocumento


class ModelTipoDocumento:
    @classmethod
    def get_tipos_documento(cls):
        connection = get_connection()
        listado = []
        with connection.cursor() as cur:
            cur.execute(
                'select id, abreviatura, nombre from tipos_de_documentos')
            data = cur.fetchall()
            for row in data:
                item = TipoDocumento(row[0], row[1], row[2])
                listado.append(item)

        connection.close()
        return listado
