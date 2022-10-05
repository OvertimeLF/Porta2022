from flask import Flask

from config import config
# Rutes
from routes import Usuarios

app = Flask(__name__)


def page_not_found(error):
    return "<h1> Pagina no encontrada</h1>", 404


if __name__ == '__main__':
    app.config.from_object(config['development'])

    # Blueprints
    app.register_blueprint(Usuarios.main, url_prefix='/api/users')

    # Error handlers (manejador de errores)
    app.register_error_handler(404, page_not_found)
    app.run()
