import 'dart:io';
import '../Controllers/eventosController.dart';


class MenuEvents {
  int? opcion;

  ControllerEventos eventos =  ControllerEventos();

  void pausa() {
    print('Presione Enter para continuar...');
    stdin.readLineSync();
  }

  void Minievents() {
    do {
      print("*****Menú Eventos********");
      print("1. Registrar Un nuevo evento");
      print("2. Listar Eventos");
      print("3. Modificar un  evento");
      print("4. Eliminar Evento");
      print("5. Regresar al Menú principa");
      print("6. Salir");

      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
        eventos.crearEvento();
          pausa();
          break;
        case 2:
        eventos.listarEventos();
          pausa();
          break;
        case 3:
          print("Modificar un evento");
          pausa();
          break;
        case 4:
          print("Eliminar evento");
          pausa();
          break;
        case 5:
          print("Regresando al menú pricipal...");
          pausa();
          return;
        case 6:
          print("Saliendo del sistema");
          pausa();
        default:
          print("Opcion no valida");
      }
    } while (opcion != 6);
  }
}

void main() {
  MenuEvents menueventos = new MenuEvents();
}
