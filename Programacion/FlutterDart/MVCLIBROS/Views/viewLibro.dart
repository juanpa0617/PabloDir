import 'dart:io';

class Libromenu {
  void menuLibro() {
    void limpiarPantalla() {
      print(
          '\x1B[2J\x1B[0;0H'); // Esto limpia la pantalla y mueve el cursor al inicio
    }

    int? opcion;

    do {
      limpiarPantalla();

      print("Bienvenido al menu de Gestión de Libros");
      print("1. Ingresar datos de un Libros");
      print("2. Listar Libros");
      print("3. Buscar Libros");
      print("4. Modificar un Libros ");
      print("5. Eliminar un Libros");
      print("6. Salir");
      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
          print("Crear un Libro");
          break;
        case 2:
          print("Listar los Libros");
          break;
        case 3:
          print("Buscar un Libro");
          break;
        case 4:
          print("Actualizar un Libro");
          break;
        case 5:
          print("Eliminar un Libro");
          break;
        case 6:
          print("Salir del Programa");
          break;
        default:
          print("Opción no válida");
      }
    } while (opcion != 6);
  }
}

void main() {
  Libromenu menuLibro = new Libromenu();
  menuLibro.menuLibro();
}
