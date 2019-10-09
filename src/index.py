from json import dumps
from flask import Flask, request

app = Flask(__name__)

@app.route('/login', methods=['GET', 'POST'])
def hello_world():
	if request.form['username'] == 'username' and request.form['password'] == 'password':
		return dumps({'msg': 'successful login'}), 200
	return dumps({'msg': 'credentials don\'t match'}), 401
