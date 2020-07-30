import base64, os
import sys
import hashlib
import parser
from flask_restful import reqparse, abort, Resource

dir = os.path.dirname(__file__)
sys.path.insert(0, dir + '/../config')

BASE_PATH_TMP = '/work/jobs/localdata/sis-vision/tmp'

parser = reqparse.RequestParser()

parser.add_argument('id')
parser.add_argument('person_id')
parser.add_argument('file_name')
parser.add_argument('base_64')

from database import DB

class Pdf(Resource):
    def p(self, raw):
        res = []
        for r in raw:
            obj = {}
            obj['id'] = r[0].strip()
            obj['person_id'] = r[1].strip()
            obj['file_name'] = r[2]
            res.append(obj)
        return res

    def get(self):
        args = parser.parse_args()
        db = DB()
        conn = db.init()
        cursor = conn.cursor()

        i = args['id']
        person_id = args['person_id']
        file_name = args['file_name']

        if i is None and file_name is None:
            cursor.execute("""select TO_CHAR(id, '9999') as id, TO_CHAR(person_id, '9999') as person_id, title from t_document""")
        elif file_name is not None:
            print(file_name)
            file_name = '%' + file_name + '%'
            cursor.execute("""select TO_CHAR(id, '9999') as id, TO_CHAR(person_id, '9999') as person_id, title from t_document where LOWER(title) LIKE %s""", (file_name.lower(),))
        elif person_id is None:
            # but not a person id
            cursor.execute("""select TO_CHAR(id, '9999') as id, TO_CHAR(person_id, '9999') as person_id, title from t_document where id = %s""", (i,))
        else:
            cursor.execute("""select TO_CHAR(id, '9999') as id, TO_CHAR(person_id, '9999') as person_id, title from t_document where id = %s and person_id = %s""", (i, person_id))
        res = cursor.fetchall()
        conn.commit()
        res = self.p(res)
        return res 

    def post(self):
        db = DB()
        args = parser.parse_args()
        conn = db.init()
        cursor = conn.cursor()

        person_id = args['person_id']
        base_64 = args['base_64']
        file_name = args['file_name']
        hash_name = hashlib.md5(file_name.encode()).hexdigest()

        cursor.execute('INSERT INTO t_document (person_id, title, hash_name) VALUES (%s, %s, %s)', (person_id, file_name, hash_name))
        conn.commit()

        cursor.execute("""select TO_CHAR(id, '9999') as id, TO_CHAR(person_id, '9999') as person_id, title from t_document where person_id = %s""", (person_id,))
        res = cursor.fetchall()
        conn.commit()
        res = self.p(res)

        return res

    def delete(self):
        db = DB()
        args = parser.parse_args()
        conn = db.init()
        cursor = conn.cursor()

        i = args['id']
        person_id = args['person_id']

        cursor.execute("""DELETE FROM t_document WHERE id = %s""", (i,))
        conn.commit()

        cursor.execute("""select TO_CHAR(id, '9999') as id, TO_CHAR(person_id, '9999') as person_id, title from t_document where person_id = %s""", (person_id,))
        res = cursor.fetchall()
        conn.commit()
        res = self.p(res)

        return res
