import 'dart:io';
import '../controllers/empleadoController.dart';


// Instancia de mi servicio
Empleadocontroller empleado = new Empleadocontroller();

class StartMain {
  void Menu() {
    int? option = 0;

    print("Bienvenido al sistema RAE");
    do {
      print("Menu de Empleado\n1. Registro\n2. Listado\n3. Salir");
      option = int.parse(stdin.readLineSync() ?? '');

      switch (option) {
        case 1:
          empleado.crear();
          break;
        case 2:
          empleado.Listar();
          break;
        case 3:
          print("Hasta la vista pirobo...");
          break;
        default:
      }
    } while (option != 3);
  }
}
