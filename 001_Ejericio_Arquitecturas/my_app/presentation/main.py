import sys
import os
sys.path.append(os.path.dirname(os.path.abspath(__file__)) + "/..")

from business_logic.user_service import UserService
from data_acces.database import DatabaseConetion

if __name__ == "__main__":
    db_adapter = DatabaseConetion("users.db")
    db_adapter.execute_query("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, type TEXT, name TEXT)")

    user_service = UserService(db_adapter)

    #Crear usuarios
    user_service.create_user("Administrador", "Mario Hernan Castillo Romero")
    user_service.create_user("Regular", "Deyi Milena Araque")


    #Mostrar los datos guardados
    usersList = user_service.get_user()
    print("Listado de Usuarios")
    for user in usersList:
        print(user)


    #Cerramos la conexion a la base de datos
    db_adapter.close_conection()