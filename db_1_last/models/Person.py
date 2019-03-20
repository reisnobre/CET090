import os
import sys
import hashlib
import parser
from flask_restful import reqparse, abort, Resource

dir = os.path.dirname(__file__)
sys.path.insert(0, dir + '/../config')

parser = reqparse.RequestParser()

parser.add_argument('id')
parser.add_argument('login')
parser.add_argument('password')
parser.add_argument('cnpj')
parser.add_argument('name')
parser.add_argument('fantasy_name')

from database import DB

class Person(Resource):
    def p(self, raw):
        res = []
        for r in raw:
            obj = {}
            obj['id'] = r[0].strip()
            obj['email'] = r[1]
            obj['cnpj'] = r[2]
            obj['name'] = r[3]
            obj['fantasy_name'] = r[4]
            res.append(obj)
        if len(res) is 1:
            res = res[0]
        return res

    def get(self):
        args = parser.parse_args()
        db = DB()
        conn = db.init()
        cursor = conn.cursor()

        login = args['login']
        if login is None:
            cursor.execute('select * from t_person')
        else:
            cursor.execute('select * from v_person where login = %s', (login,))
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
        cnpj = args['cnpj']
        name = args['name']
        fantasy_name = args['fantasy_name']

        cursor.execute('INSERT INTO t_person (login, password, cnpj, name, fantasy_name) VALUES (%s, %s, %s, %s, %s)', (login, password, cnpj, name, fantasy_name))
        conn.commit()

        cursor.execute('select * from v_person where login = %s', (login,))
        res = cursor.fetchall()
        conn.commit()
        res = self.p(res)

        return res
