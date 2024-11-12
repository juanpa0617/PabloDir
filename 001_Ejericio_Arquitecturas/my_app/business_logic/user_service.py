
from patterns.factory import UserFactory
from patterns.observer import UserObserver

class UserService:
    def __init__(self, db_adapter):
        self.db_adapter = db_adapter
        self.observer = UserObserver()

    def create_user(self, type_user, name): #Administrador, Pedro
        self.user = UserFactory.create_user(type_user, name)
        self.db_adapter.execute_query("INSERT INTO users(type, name) VALUES (?,?)", (type_user, name))
        self.observer.notify(f"El usuario {name} de tipo {type_user}, ha sido creado con exito.")
        return self.user
    
    def get_user(self):
        self.user = self.db_adapter.fetch_data("SELECT * FROM users")
        return  self.user