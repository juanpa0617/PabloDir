import 'dart:io';
import '../Controller/artistaController.dart';

class Menuartistas {
  int? opcion;
  Artistacontroller artistas = new  Artistacontroller();

  void limpiarPantalla() {
    print('\x1B[2J\x1B[0;0H');
  }

  void pausar() {
    print("\nPresione Enter para continuar...");
    stdin.readLineSync();
  }

  void menuartista() {
    do {
      limpiarPantalla();
      print("Bienvenido al menú Artistas");
      print("1. Registrar un Nuevo Artista");
      print("2. Listar los  Artistas");
      print("3. Modificar un  Artista");
      print("4. Eliminar un  Artista");
      print("5. Volver al menú");

      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
          limpiarPantalla();
          print("Crear");
          artistas.createArtist();
          pausar();

          break;
        case 2:
          limpiarPantalla();

          print("Listar");
          artistas.ListArtist();
          pausar();

          break;
        case 3:
          limpiarPantalla();

          print("Modificar");
          pausar();

          break;
        case 4:
          limpiarPantalla();

          print("Eliminar");
          pausar();

          break;
        case 5:
          limpiarPantalla();

          print("Volviendo....al menú");
          pausar();

          return;
        default:
          print("Opción no válida");
      }
    } while (opcion != 5);
  }
}

void main() {
  Menuartistas menuartistas = new Menuartistas();
  menuartistas.menuartista();
}
