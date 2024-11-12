import 'dart:io';
import 'MVCEMBARCACION/Views/Viewembarcacion.dart';
import 'MVCEMBARCACION/Views/Viewtripulantes.dart';

class Menuprincipal {
  MenuEmbarcaciones embarcaciones = MenuEmbarcaciones();
  MenuTripulantes menuTripulantes = MenuTripulantes();

  int? opcion;
  void Menu() {
    do {
      print("Menu de  Tripulantes");
      print("1. Gestion de  Embarcaciones");
      print("2. Gestion de tripulantes");
      print("3. Gestion  de reservas");
      print("4. Salir");

      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
          embarcaciones.Menu();
          break;
        case 2:
          menuTripulantes.Menu();
          break;
        case 3:
          print("Modificar");
          break;
        case 4:
          print("Eliminar");
          break;

        default:
          print("Opcion no valida");
      }
    } while (opcion != 5);
  }
}

void main(){
  Menuprincipal menuprincipal = Menuprincipal();
  menuprincipal.Menu();
}
