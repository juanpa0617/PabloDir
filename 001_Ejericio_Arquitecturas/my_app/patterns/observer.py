# PATRON DE COMPORTAMIENTO

class UserObserver:
    def __init__(self):
        self.notification = []

    def notify(self, message):
        self.notification.append(message)
        print(f"Notificación : {message} ")