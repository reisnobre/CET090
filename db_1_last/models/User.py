import os
import sys
import hashlib
import parser
from flask_restful import reqparse, abort, Resource

dir = os.path.dirname(__file__)
sys.path.insert(0, dir + '/../config')

parser = reqparse.RequestParser()

parser.add_argument('login')
parser.add_argument('password')

from database import DB

class User(Resource):
    def p(self, raw):
        res = []
        for r in raw:
            obj = {}
            obj['id'] = r[0]
            obj['email'] = r[1]
            obj['password'] = r[2]
            res.append(obj)
        if len(res) is 1:
            res = res[0]
        return res

    def get(self):
        args = parser.parse_args()
        db = DB()
        conn = db.init()
        cursor = conn.cursor()
        i = args['id']
        if i is None:
            cursor.execute('SELECT * FROM v_contato')
        else:
            cursor.execute('SELECT * FROM v_contato WHERE "ctt_cod" = %s', i)
            
        res = cursor.fetchall()
        conn.commit()
        res = self.p(res)
        return res 

    def post(self):
        db = DB()
        args = parser.parse_args()
        conn = db.init()
        cursor = conn.cursor()

        login = args['login']
        password = hashlib.md5(args['password'].encode()).hexdigest()
        cursor.execute('INSERT INTO t_user (login, password) VALUES (%s, %s)', (login, password))
        conn.commit()
        return { 'response': cursor.statusmessage }


    
