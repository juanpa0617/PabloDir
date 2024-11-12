import 'dart:io';

import '../Views/viewsEventos.dart';
import '../Views/viewsInvitados.dart';

MenuEvents menuEvents  = MenuEvents();
MenuInvit menuInvit  = MenuInvit();


class MenuPricipal {
  int?opcion;
  void limpiarPantalla() {
    print('\x1B[2J\x1B[0;0H');
  }

  void Menu() {
    do {
      print("Bienvenido a la Gestión NextCode");
      print("1. Gestión de Invitados");
      print("2. Gestión de Eventos");
      print("3. Salir");

      opcion = int.parse(stdin.readLineSync()?? '');
      switch (opcion) {
        case 1:
        limpiarPantalla();
          print("Gestión de Invitados");
          menuInvit.Minuevents();
          break;
        case 2:
        limpiarPantalla();
          print("Gestión de Eventos");
          menuEvents.Minievents();
          break;
        case 3:
          print("Adiós");
      }
    } while (opcion != 3);
  }
}

void main() {
  MenuPricipal menu = MenuPricipal();
  menu.Menu();
}
