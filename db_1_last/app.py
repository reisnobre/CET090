import os
import sys
from flask import Flask
from flask_restful import Resource, Api
from flask_cors import CORS

dir = os.path.dirname(__file__)
sys.path.insert(0, dir + 'models')

from User import User
from Person import Person
from Auth import Auth
from Pdf import Pdf 

CLASSES = ['das', 'darf']
BASE_FOLDERS = ['images', 'pdfs', 'tmp']

BASE_PATH = '/work/jobs/localdata/sis-vision'

BASE_PATH_IN = '{}/pdfs'.format(BASE_PATH)
BASE_PATH_OUT = '{}.images'.format(BASE_PATH)
BASE_PATH_TMP = '/work/jobs/localdata/sis-vision/tmp'

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = BASE_PATH_TMP 
api = Api(app)

api.add_resource(User, '/user')
api.add_resource(Person, '/person')
api.add_resource(Auth, '/auth')
api.add_resource(Pdf, '/pdf')

CORS(app)

def setup():
    os.chdir(BASE_PATH)
    for folder in BASE_FOLDERS:
        workdir = BASE_PATH + '/{}'.format(folder)
        if not os.path.exists((workdir)):
            os.makedirs(workdir)

if __name__ == "__main__":
    setup()
    app.run()
