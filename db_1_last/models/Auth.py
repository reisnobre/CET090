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

class Auth(Resource):
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
        db = DB()
        rows = db.query('select * from t_user')
        res = rows.fetchone()
        db.close()
        return { 'response': res }

    def post(self):
        db = DB()
        args = parser.parse_args()
        conn = db.init()
        cursor = conn.cursor()

        login = args['login']
        password = hashlib.md5(args['password'].encode()).hexdigest()

        cursor.execute('select * from t_person where login = %s', (login,))
        res = cursor.fetchone()

        if password == res[2]:
            cursor.execute('select * from v_person where login = %s', (login,))
            res = cursor.fetchall()
            conn.commit()
            res = self.p(res)
            return res

        else:
            return None
