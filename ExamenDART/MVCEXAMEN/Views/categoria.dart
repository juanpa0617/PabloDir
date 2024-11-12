import 'dart:io';
import '../Controllers/controllerCategorias.dart';

class MenuCategoria {
  int? opcion;
  CategoriaController categoria = new CategoriaController();
  void Menucategoria() {
    do {
      print("Menu de  Tripulantes");
      print("1. Crear una categoria");
      print("2. Listar una categoria");
      print("3. Modificar una categoria");
      print("4. Eliminar una categoria");
      print("5. Volver al menú");
      print("6. Salir");

      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
          categoria.CreateCategory();
          break;
        case 2:
          categoria.CategoryList();
          break;
        case 3:
          print("Ingrese el codigo de la categoria a modificar");
          String codigoBuscado = stdin.readLineSync() ?? '';
          categoria.UpdateCategory(codigoBuscado);
          break;
        case 4:
          print("Ingrese el codigo de la categoria a eliminar");
          String codigoEliminated = stdin.readLineSync() ?? '';
          categoria.DeleteCategory(codigoEliminated);
          break;
        case 5:
          print("Volviendo al menú pricipal");
          return;
        case 6:
          print("Saliendo");
          break;
        default:
          print("Opcion no valida");
      }
    } while (opcion != 6);
  }
}

void main() {
  MenuCategoria menuCategoria = MenuCategoria();
  menuCategoria.Menucategoria();
}
