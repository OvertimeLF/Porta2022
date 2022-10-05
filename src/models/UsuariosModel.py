from database.db import get_connection
from .entities.Usuario import Usuario


class UsuariosModel():
    @classmethod
    def get_usuarios(self):
        try:
            connection = get_connection()
            users = []

            with connection.cursor() as cursor:
                cursor.execute(
                    "SELECT rut_usuario, nombres, apellidos," +
                    "email, id_tipo, pgp_sym_decrypt(contrasena::bytea,'AES_KEY') from usuario")
                resultset = cursor.fetchall()

                for row in resultset:
                    user = Usuario(row[0], row[1], row[2],
                                    row[3], row[4], row[5])
                    users.append(user.to_JSON())

            connection.close()
            return users
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_usuario(self, rut_usuario, contrasena):
        try:
            connection = get_connection()

            with connection.cursor() as cursor:
                cursor.execute("SELECT rut_usuario, nombres, apellidos, email," +
                               "id_tipo from usuario where rut_usuario = %s" +
                               "and pgp_sym_decrypt(contrasena::bytea,'AES_KEY') = %s", (rut_usuario, contrasena,))
                row = cursor.fetchone()

                user = None
                if row != None:
                    user = Usuario(row[0], row[1], row[2],
                                    row[3], row[4])
                    user = user.to_JSON()

            connection.close()
            return user
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def add_usuario(self, user):
        try:
            connection = get_connection()

            with connection.cursor() as cursor:
                cursor.execute("insert into usuario (rut_usuario,nombres,apellidos,email,id_tipo,contrasena)" +
                               "VALUES (%s,%s,%s,%s,%s,PGP_SYM_ENCRYPT(%s,'AES_KEY'))", 
                                (user.rut,user.nombres, user.apellidos,user.email,user.id_tipo,user.contrasena,))
                affected_rows = cursor.rowcount
                connection.commit()

            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)
