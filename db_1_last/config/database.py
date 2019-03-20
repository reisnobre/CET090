import psycopg2

host = 'localhost'
user = 'flask'
password = 'mohonda_flask' 
database = 'main'

class DB:
    def __init__(self):
        self.__host = host
        self.__user = user
        self.__password = password
        self.__database = database
        self.conn = psycopg2.connect('dbname={} user={} host={} password={}'.format(self.__database, self.__user, self.__host, self.__password))

    def init(self):
        return self.conn

    def cursor(self):
        cursor = self.conn.cursor()
        return cursor

    def close(self):
        self.conn.close()
