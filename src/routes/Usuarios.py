from flask import Blueprint, jsonify, request

# entities

from models.entities.Usuario import Usuario
# modelos
from models.UsuariosModel import UsuariosModel

main = Blueprint('usuarios_blueprint', __name__)


@main.route('/')
def get_usuarios():
    try:
        users = UsuariosModel.get_usuarios()
        return jsonify(users)
    except Exception as ex:
        return jsonify({'Message': str(ex)}), 500


@main.route('/<rut_usuario>,<contrasena>')
def get_usuario(rut_usuario, contrasena):
    try:
        user = UsuariosModel.get_usuario(rut_usuario, contrasena)
        if user != None:
            return jsonify(user)
        else:
            return jsonify({}), 404
    except Exception as ex:
        return jsonify({'Message': str(ex)}), 500


@main.route('/add', methods=['POST'])
def add_usuario():
    try:
        rut = request.json['rut']
        nombres = request.json['nombres']
        apellidos = request.json['apellidos']
        email = request.json['email']
        contrasena = request.json['contrasena']
        user = Usuario(rut, nombres, apellidos, email,7, contrasena)

        if len(rut) < 9 or len(contrasena) > 12 or len(contrasena) < 6 or nombres == None \
            or apellidos == None or email == None or contrasena == None:
            return jsonify({'message': "Error on data for insert"}), 500
        else:
            affected_rows = UsuariosModel.add_usuario(user)
            
        if affected_rows == 1:
            return jsonify(user.contrasena)
        else:
            return jsonify({'message': "Error on insert"}), 500
            
    except Exception as ex:
        return jsonify({'Message': str(ex)}), 500
