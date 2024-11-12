import 'dart:io';
import '../Models/categorias.dart';

List<Categoria> listcategorias = [];

class CategoriaController {
  void CreateCategory() {
    print("Print ingrese la cantidad de las categorias a registrar");
    int cantidad = int.parse(stdin.readLineSync() ?? '');

    for (var i = 0; i < cantidad; i++) {
      Categoria categoria = Categoria();
      print("Categoria ${i + 1}");
      print("Ingrese el codigo de la categoria");
      categoria.Codigo = stdin.readLineSync() ?? '';
      print("Ingrese el Nombre de la categoria");
      categoria.Nombre = stdin.readLineSync()??'';

      print("Categoria agregada");
      listcategorias.add(categoria);
    }
  }

  void CategoryList() {
    for (var i = 0; i < listcategorias.length; i++) {
      print("*****Categorias***********");
      print("Categoria ${i + 1}");
      print("Codigo: ${listcategorias[i].Codigo}");
      print("Nombre: ${listcategorias[i].Nombre}");
    }
  }

  Categoria? SearchCategory(String codigo) {
    for (var categoria in listcategorias) {
      if (categoria.Codigo == codigo) {
        return categoria;
      }
    }
    print("Categoria No existe");
    return null;
  }

  void UpdateCategory(codigoBuscado) {
    Categoria? categoria = SearchCategory(codigoBuscado);

    if (categoria != null) {
      print("Ingrese el nuevo codigo");
      categoria.Codigo = stdin.readLineSync() ?? '';
      print("Ingrese el nuevo nombre ");
      categoria.Nombre = stdin.readLineSync() ?? '';
      print("************Categoria actualizada************");
    }
  }

  void DeleteCategory(codigoBuscado) {
    Categoria? categoria = SearchCategory(codigoBuscado);

    if (categoria != null) {
      listcategorias.remove(categoria);
      print("Categoria eliminada exitosamente");
    }
  }
}

