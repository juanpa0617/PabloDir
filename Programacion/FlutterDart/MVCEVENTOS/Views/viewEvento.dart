import 'dart:io';
import '../Controller/eventosController.dart';

class MenuEvento {
  int? opcion;
  EventosController eventos = new EventosController();
  void limpiarPantalla() {
    print('\x1B[2J\x1B[0;0H');
  }

  void pausar() {
    print("\nPresione Enter para continuar...");
    stdin.readLineSync();
  }

  void menueventos() {
    do {
      limpiarPantalla();
      print("Bienvenido al menú Eventos");
      print("1. Registrar un Nuevo Eventos");
      print("2. Listar los  Eventos");
      print("3. Modificar un  Eventos");
      print("4. Eliminar un  Eventos");
      print("5. Volver al menú");

      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
          limpiarPantalla();
          eventos.createEventos();
          print("Crear");
          pausar();
          break;
        case 2:
          limpiarPantalla();
          eventos.listEvents();
          print("Listar");
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
    } while (opcion != 3);
  }
}

void main() {
  MenuEvento menu = MenuEvento();
  menu.menueventos();
}
