import 'dart:io';
import '../Controllers/tripulantesController.dart';

class MenuTripulantes {
  int? opcion;
  ControllerTripulantes tripulantes = ControllerTripulantes();

  void Menu() {
    do {
      print("Menu de  Tripulantes");
      print("1. Ingresar un tripulante");
      print("2. Listrar tripulantes");
      print("3. Modificar un tripulante");
      print("4. Eliminar un tripulante");
      print("5. Volver al menu principal");
      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
          tripulantes.createTripulantes();
          break;
        case 2:
          tripulantes.ListTripulantes();
          break;
        case 3:
          print("Ingrese el documento del tripulante");
          String documento = stdin.readLineSync() ?? '';
          tripulantes.UpdateTripulante(documento);
          break;
        case 4:
          print("Ingrese el documento del tripulante");
          String documento1 = stdin.readLineSync() ?? '';
          tripulantes.DeleteTriupulante(documento1);
          break;
        case 5:
          print("Return");
          return;
        default:
          print("Opcion no valida");
      }
    } while (opcion != 5);
  }
}

void main() {
  MenuTripulantes menuTripulantes = MenuTripulantes();
}
