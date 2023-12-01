from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root@127.0.0.1:3306/coetagri'
db = SQLAlchemy(app)

class Login(db.Model):
    idLOGIN = db.Column(db.Integer, primary_key=True)
    user = db.Column(db.String(45), nullable=False)
    password = db.Column(db.String(45), nullable=False)

# Rota para obter todos os usuários
@app.route('/usuarios', methods=['GET'])
def get_usuarios():
    usuarios = Login.query.all()
    usuarios_json = [{'user': usuario.user, 'password': usuario.password} for usuario in usuarios]
    return jsonify({'usuarios': usuarios_json})

# Rota para obter informações de um usuário específico
@app.route('/usuarios/<int:id>', methods=['GET'])
def get_usuario(id):
    usuario = Login.query.get(id)
    if usuario:
        usuario_json = {'user': usuario.user, 'password': usuario.password}
        return jsonify({'usuario': usuario_json})
    else:
        return jsonify({'message': 'Usuário não encontrado'}), 404

# Rota para processar o login
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()

    if 'username' not in data or 'password' not in data:
        return jsonify({'message': 'Credenciais incompletas'}), 400

    username = data['username']
    password = data['password']

    # Consultar o banco de dados para verificar as credenciais
    user = Login.query.filter_by(user=username, password=password).first()

    if user:
        return jsonify({'message': 'Login bem-sucedido'}), 200
    else:
        return jsonify({'message': 'Credenciais inválidas'}), 401


if __name__ == '__main__':
    app.run(debug=True)
