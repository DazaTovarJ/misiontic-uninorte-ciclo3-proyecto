from datetime import date

class Pais():
    def __init__(self, id, pais) :
        self.id= id
        self.pais = pais
    pass
    
    def serialize(obj):
        if isinstance(obj, date):
            serial = obj.isoformat()
            return serial

        return obj.__dict__