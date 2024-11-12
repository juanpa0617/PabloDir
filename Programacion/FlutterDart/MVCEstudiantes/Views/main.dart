import 'dart:io';
import 'MenuEmpelados.dart';
import 'MenuRoles.dart';

class Menuview {
  final MenuEmployees menu = MenuEmployees();
  final MenuRoles roles = MenuRoles();

  void MenuGestion() {
    int opcion = 0;
    String? continuar;
    do {
      print("Bienvenido al Menú");
      print("1. Gestión de Roles");
      print("2. Gestión de Empleados");
      print("3. Salir");

      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
          print("Gestión de Roles");
          roles.Menuroles();
          break;
        case 2:
          print("Gestión de Empleados");
          menu.menuEmployee();

          break;
        case 3:
          print("Saliendo del programa");
      }

      
    } while (opcion !=3);
  }
}

void main() {
  Menuview menu = Menuview();
  menu.MenuGestion();
}
