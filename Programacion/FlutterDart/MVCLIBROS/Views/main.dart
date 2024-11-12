import 'dart:io';

import '../Views/viewEstudiante.dart';
import '../Views/viewLibro.dart';
import '../Views/viewPrestamo.dart';

class menuPrincipal {
  final menuPrestamos menuprestamos = menuPrestamos();
  final menuEstudiante menuestudiante = menuEstudiante();
  final Libromenu menulibro = Libromenu();

  void limpiarPantalla() {
    print(
        '\x1B[2J\x1B[0;0H'); // Esto limpia la pantalla y mueve el cursor al inicio
  }

  void menu() {
    int? opcion;

    do {
      limpiarPantalla();
      print("Bienvenido al Menú");
      print("1.Gestion de Estudiantes");
      print("2.Gestion de Libros");
      print("3.Gestion de Prestamos");
      print("4.Saliendo del sistema");
      opcion = int.tryParse(stdin.readLineSync() ?? '');
      switch (opcion) {
        case 1:
          menuestudiante.menuestudiante();
          break;
        case 2:
          menulibro.menuLibro();
          break;
        case 3:
          menuprestamos.menuprestamos();
          break;
        case 4:
      }
    } while (opcion != 4);
  }
}

void main() {
  final menuPrincipal menucito = new menuPrincipal();
  menucito.menu();
}
