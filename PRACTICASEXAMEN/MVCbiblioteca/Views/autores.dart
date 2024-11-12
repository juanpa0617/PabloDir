import 'dart:io';
import '../Controllers/controllerAutores.dart';

class menuAutores {
  int? opcional;
  ControllerAutores controllerAutores = ControllerAutores();

  void AutoresMenu() {
    do {
      print("1. Ingresar un Autor Libro");
      print("2. Listar  Autores");
      print("3. Modificar un  Autor");
      print("4. Eliminar un  Autor");
      print("5. Regresar al menu pricinpal");
      print("6. Salir");
      opcional = int.parse(stdin.readLineSync() ?? '');

      switch (opcional) {
        case 1:
          controllerAutores.CreateAutors();
          break;
        case 2:
          controllerAutores.ListAutors();
          break;
        case 3:
          print("Ingrese el documento del autor a Editar");
          int documento = int.parse(stdin.readLineSync() ?? '');
          controllerAutores.UpdateAutor(documento);
          break;
        case 4:
          print("Ingrese el documento del  a eliminar");
          int documentoDelete = int.parse(stdin.readLineSync() ?? '');
          controllerAutores.UpdateAutor(documentoDelete);
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

void main() {
  menuAutores menuAutor = menuAutores();
  menuAutor.AutoresMenu();
}
