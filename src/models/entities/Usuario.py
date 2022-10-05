class Usuario():
    def __init__(self, rut, nombres=None, apellidos=None,
                 email=None, id_tipo=None, contrasena=None) -> None:
        self.rut = rut
        self.nombres = nombres
        self.apellidos = apellidos
        self.email = email
        self.id_tipo = id_tipo
        self.contrasena = contrasena

    def to_JSON(self):
        return{
            'rut' : self.rut,
            'nombres' : self.nombres,
            'apellidos' : self.apellidos,
            'email' : self.email,
            'id_tipo' : self.id_tipo,
            'contrasena' : self.contrasena
        }