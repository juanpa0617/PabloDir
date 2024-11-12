# PATRON DE CREACIÓN

class User:
    def __init__(self, name):
        self.name = name


class UserAdmin(User):
    def __init__(self, name):
        super().__init__(name)


class RegularUser(User):
    def __init__(self, name):
        super().__init__(name)


class UserFactory:
    @staticmethod
    def create_user(type_user, name): 
        if(type_user == "Administrador"):
            return UserAdmin(name)
        elif(type_user == "Regular"):
            return RegularUser(name)
        else:
            return ValueError("El tipo de rol, no es permitido")