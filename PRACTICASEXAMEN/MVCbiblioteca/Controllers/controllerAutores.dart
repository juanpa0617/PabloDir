import 'dart:io';

import '../Model/Autores.dart';

List<Autores> AutoresList = [];

class ControllerAutores {
  void CreateAutors() {
    print("Ingrese la cantidad de autores");
    int cantidad = int.parse(stdin.readLineSync() ?? '');

    for (var i = 0; i < cantidad; i++) {
      Autores autor = Autores();
      print("Autor ${i + 1}");
      print("***************************");
      print("Ingrese el Documento del autor");
      autor.Documento = int.parse(stdin.readLineSync() ?? '');
      print("Ingrese el Nombre del autor");
      autor.Nombre = stdin.readLineSync() ?? '';
      print("Ingrese el Apellido del autor");
      autor.Apellido = stdin.readLineSync() ?? '';
      print("Ingrese la Ciudad");
      autor.Ciudad = stdin.readLineSync() ?? '';

      print("Autor agregado\n");
      AutoresList.add(autor);
    }
  }

  void ListAutors() {
    for (var i = 0; i < AutoresList.length; i++) {
      print("Autor ${i + 1}");
      print("***************************");
      print("Documento: ${AutoresList[i].Documento}");
      print("Nombre: ${AutoresList[i].Nombre}");
      print("Apellido: ${AutoresList[i].Apellido}");
      print("Ciudad: ${AutoresList[i].Ciudad}");
      print("***************************");
    }
  }

  Autores? SearchAutor(int documento) {
    for (var autor in AutoresList) {
      if (autor.Documento == documento) {
        return autor;
      }
    }
    print("Autor No existe");
    return null;
  }

  void UpdateAutor(documentoBuscado) {
    Autores? autor = SearchAutor(documentoBuscado);

    if (autor != null) {
      print("Ingrese el nuevo Documento del autor");
      autor.Documento = int.parse(stdin.readLineSync() ?? '');
      print("Ingrese el nuevo Nombre del autor");
      autor.Nombre = stdin.readLineSync() ?? '';
      print("Ingrese el nuevo Apellido del autor");
      autor.Apellido = stdin.readLineSync() ?? '';
      print("Ingrese la nueva Ciudad");
      autor.Ciudad = stdin.readLineSync() ?? '';

      print("************Autor actualizado************");
    }
  }

  void DeleteAutor(documentoBuscado) {
    Autores? autor = SearchAutor(documentoBuscado);
    if (autor != null) {
      AutoresList.remove(autor);
      print("Autor Eliminado");
    }
  }
}
