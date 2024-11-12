import sqlite3

class DatabaseConetion:

    # Función para conectar a mi base de datos
    def __init__(self, db_name):
        self.conn = sqlite3.connect(db_name)
        self.cursor = self.conn.cursor()

    
    # Función para ejecutar querys 
    def execute_query(self, query, params=()):
        self.cursor.execute(query,params)
        self.conn.commit()
    

    # Función para ejecutar las peticiones
    def fetch_data(self, query, params=()):
        self.cursor.execute(query,params)
        return self.cursor.fetchall()


    # Función para cerrar la conexión
    def close_conection(self):
        self.conn.close()

