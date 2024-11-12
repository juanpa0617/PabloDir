import 'dart:io';
import '../Controllers/controllerLibros.dart';
class menuLibros {
  int? opcional;

LibrosController  librosController = new LibrosController();

  void LibrosMenu() {
    do {
      print("1. Ingresar un nuevo Libro");
      print("2. Listar  Libros");
      print("3. Modificar un  Libro");
      print("4. Eliminar un  Libro");
      print("5. Regresar al menu pricinpal");
      print("6. Salir");
      opcional = int.parse(stdin.readLineSync() ?? '');

      switch (opcional) {
        case 1:
        librosController.CreateBooks();
          break;
        case 2:
        librosController.ListBooks();
          break;
        case 3: 
        print("Ingrese el codigo del libro a actualizar");
        String codigoLibro  = stdin.readLineSync() ?? '';
        librosController.UpdateBook(codigoLibro);  
          break;
        case 4:
        print("Ingrese el codigo del libro a Eliminar");
        String codigoLi  = stdin.readLineSync() ?? '';
        librosController.DeleteBook(codigoLi);
          break;
        case 5:
          print("Regresar al menu principal");
          return;
        case 6:
          print("Saliendo....");
        default:
          print("Opción no válida");
      }
    } while (opcional != 6);
  }
}

void main () {
  menuLibros menu = menuLibros();
  menu.LibrosMenu();
  }

