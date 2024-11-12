import 'dart:io';
import 'viewEvento.dart';
import 'viewArtista.dart';

class Menuprincipal {
        int? opcion;

  Menuartistas  _menuartistas = new Menuartistas();
  MenuEvento _menueventos = new MenuEvento();



  void limpiarPantalla() {
    print(
        '\x1B[2J\x1B[0;0H'); 
  }

  void menuPricipal() {

    do {
      limpiarPantalla();
      print("Bienvenido al menú");
      print("1. Gestión de eventos");
      print("2. Gestión de artistas");
      print("3. Salir");
      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
        _menueventos.menueventos();
          break;
        case 2:
        _menuartistas.menuartista();
          break;
        default:
          print("Opción no válida");
      }
    } while (opcion != 3);
  }
}

void main() {
  Menuprincipal menu = new Menuprincipal();
  menu.menuPricipal();
}
