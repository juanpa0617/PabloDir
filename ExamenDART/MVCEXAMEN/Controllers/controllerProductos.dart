import '../Models/categorias.dart';
import 'controllerCategorias.dart';
import '../Models/productos.dart';
import 'dart:io';

List<Productos> listProductos = [];

class ProductosController {
  CategoriaController categorias = CategoriaController();

  void CreateProductos() {
   if (listcategorias.length <= 0) {
     print("Lo sentimos debees de registrar una categoria primero");
   }else{
     print("Ingrese la cantidad de productos a registrar");
    int cantidad = int.parse(stdin.readLineSync() ?? '');
    
    for (var i = 0; i < cantidad; i++) {
      Productos producto = Productos();
      print("Ingrese el Codgio del producto");
      producto.Codigo = stdin.readLineSync() ?? '';
      print("Ingrese el nombre del producto");
      producto.Nombre = stdin.readLineSync() ?? '';
      print("Ingrese el stock del producto");
      producto.Stock = int.parse(stdin.readLineSync() ?? '');
      print("Ingrese el valor del producto");
      producto.Precio = double.parse(stdin.readLineSync() ?? '');

      print("******Lista de categorias******");
      categorias.CategoryList();

      print("Selecciona la categoria del producto");
      String codigoCategoria = stdin.readLineSync() ?? '';

      Categoria? categoriaSeleccioanda =
          categorias.SearchCategory(codigoCategoria);

      if (categoriaSeleccioanda != null) {
        producto.categoria = categoriaSeleccioanda;

        print(
            "Producto ${producto.Nombre} agregado con la categoria ${categoriaSeleccioanda.Nombre}");
      } else {
        print("Lo sentimos No hay categorias Encontradas");
         
      }
      listProductos.add(producto);
    }
   }

  }

  void ListProducts() {
    if (listProductos.isEmpty) {
      print("No productos registrados");
    } else {
      for (var i = 0; i < listProductos.length; i++) {
        print("Código del Producto: ${listProductos[i].Codigo}");
        print("Nombre Producto: ${listProductos[i].Nombre}");
        print("Stock Producto: ${listProductos[i].Stock}");
        print("Precio Producto: ${listProductos[i].Precio}");
        if (listProductos[i].categoria != null) {
          print(
              "Categoria: ${listProductos[i].categoria!.Nombre} ${listProductos[i].categoria!.Codigo}");
        } else {
          print("Categoria del producto: No asignado");
        }

        print("------------------------------------------------");
      }
    }
  }

  Productos? SearchProducts(String codigoProducto) {
    for (var i = 0; i < listProductos.length; i++) {
      if (listProductos[i].Codigo == codigoProducto) {
        return listProductos[i];
      }
    }
    print("Producto No  encontrado");
    return null;
  }

  void UpdateBook(codigoproducto) {
    Productos? productos = SearchProducts(codigoproducto);
    if (productos != null) {
      print("Ingrese el nuevo Codigo  del Producto");
      productos.Codigo = stdin.readLineSync()!;
      print("Ingrese el nuevo nombre del producto");
      productos.Nombre = stdin.readLineSync() ?? '';
      print("Ingrese el nuevo stock del producto");
      productos.Stock = int.parse(stdin.readLineSync() ?? '');
      print("Ingrese el nuevo precio del producto");
      productos.Precio = double.parse(stdin.readLineSync() ?? '');
      print("****************Categoria lista********");
      categorias.CategoryList();
      print("Ingrese el codigo de la categoria");
      String CodigoCategoria = stdin.readLineSync() ?? '';

      Categoria? categoriaSeleccionada =
          categorias.SearchCategory(CodigoCategoria);
      if (categoriaSeleccionada != null) {
        productos.categoria = categoriaSeleccionada;
        print(
            "Producto actualizado con exito con la categoria :${categoriaSeleccionada.Nombre} y Codigo: ${categoriaSeleccionada.Codigo}");
      } else {
        print("Categoria no encontrada");
      }
    } else {
      print("Producto no encontrado");
    }
  }

  void DeleteCategory(String codigoproducto) {
    for (var i = 0; i < listProductos.length; i++) {
      if (listProductos[i].Codigo == codigoproducto) {
        listProductos.removeAt(i);
        print("Producto eliminado con exito");
      }
    }
  }
}
