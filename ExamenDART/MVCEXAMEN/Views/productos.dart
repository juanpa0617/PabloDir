import 'dart:io';
import '../Controllers/controllerProductos.dart';
import '../Views/productos.dart';
class MenuProductos {
  int? opcion;

  void menuProductos() {
    ProductosController productos = new ProductosController();
    do {
      print("Menu de  Tripulantes");
      print("1. Crear un producto");
      print("2. Listar un producto");
      print("3. Modificar un producto");
      print("4. Eliminar un producto");
      print("5. Volver al menú");
      print("6. Salir");

      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
        productos.CreateProductos();
          break;
        case 2:
        productos.ListProducts();
          break;
        case 3:
        print("Ingrese el codigo del producto a modificar");
        String codigoproducto = stdin.readLineSync()??'';
        productos.UpdateBook(codigoproducto);
          break;
        case 4:
        print("Ingrese el codigo del producto a eliminar");
        String codigoproducto1 = stdin.readLineSync()??'';
        productos.DeleteCategory(codigoproducto1);
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
  MenuProductos menuproductos = MenuProductos();
  menuproductos.menuProductos();
  
}
