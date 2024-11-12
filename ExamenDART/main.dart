import 'dart:io';
import 'MVCEXAMEN/Views/categoria.dart';
import 'MVCEXAMEN/Views/productos.dart';

class Menuprincipal {
  MenuCategoria menucategoria = MenuCategoria();
  MenuProductos menuproducto = MenuProductos();
  int? opcion;
  void Menu() {
    do {
      print("Menu de  Tripulantes");
      print("1. Gestion de  Categorias");
      print("2. Gestion de Productos");
      print("3. Salir");

      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
        menucategoria.Menucategoria();
          break;
        case 2:
        menuproducto.menuProductos();
          break;
        case 3:
          print("Saliendo");
          break;

        default:
          print("Opcion no valida");
      }
    } while (opcion != 3);
  }
}

void main() {
  Menuprincipal menuprincipal = Menuprincipal();
  menuprincipal.Menu();
}
