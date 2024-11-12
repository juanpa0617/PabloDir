import 'dart:io';
import '../Controllers/controllerAutores.dart';
import '../Model/Autores.dart';
import '../Model/Libros.dart';

List<Libros> Listlibros = [];
ControllerAutores auteres = ControllerAutores();

class LibrosController {
  void CreateBooks() {
    print("Ingrese la cantidad de libros a registrar");
    int cantidad = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < cantidad; i++) {
      Libros libros = Libros();

      print("Ingrese el codigo del Libro");
      libros.Codigo = stdin.readLineSync()!;
      print("Ingrese el Titulo del Libro");
      libros.Titulo = stdin.readLineSync()!;
      print("****Lista de Autores**********");
      auteres.ListAutors();
      print("Ingrese el Autor del Libro");
      int documentoAutor = int.parse(stdin.readLineSync() ?? '');
      print("Ingrese la fecha de publicación");
      libros.FechaPublicacion = stdin.readLineSync()!;

      Autores? autorSeleciconado = auteres.SearchAutor(documentoAutor);

      if (autorSeleciconado != null) {
        libros.Autor = autorSeleciconado;
        print(
            "Libro agregado con exito con el autor :${autorSeleciconado.Nombre} ${autorSeleciconado.Apellido} ");
      } else {
        print("Autor no encontrado");
        i--;
      }
      Listlibros.add(libros);
    }
  }

  void ListBooks() {
    for (var i = 0; i < Listlibros.length; i++) {
      print("Código del Libro: ${Listlibros[i].Codigo}");
      print("Título del Libro: ${Listlibros[i].Titulo}");
      if (Listlibros[i].Autor != null) {
        print(
            "Autor del Libro: ${Listlibros[i].Autor!.Nombre} ${Listlibros[i].Autor!.Apellido}");
      } else {
        print("Autor del Libro: No asignado");
      }

      print("------------------------------------------------");
    }
  }

  Libros? SearchBook(String codigolibr) {
    for (var i = 0; i < Listlibros.length; i++) {
      if (Listlibros[i].Codigo == codigolibr) {
        return Listlibros[i];
      }
    }
    print("Libro No  encontrado");

    return null;
  }

  void UpdateBook(codigolibr) {
    Libros? libro = SearchBook(codigolibr);
    if (libro != null) {
      print("Ingrese el nuevo Codigo  del Libro");
      libro.Codigo = stdin.readLineSync()!;

      print("Ingrese el nuevo Titulo del Libro");
      String? Titulo = stdin.readLineSync();
      libro.Titulo = Titulo;
      print("Ingrese el nuevo Autor del Libro");
      int? documentoAutor = int.parse(stdin.readLineSync() ?? '');
      print("Ingresa la fecha de publicación");
      libro.FechaPublicacion = stdin.readLineSync()!;

      Autores? autorSeleciconado = auteres.SearchAutor(documentoAutor);
      if (autorSeleciconado != null) {
        libro.Autor = autorSeleciconado;
        print(
            "Libro actualizado con exito con el autor :${autorSeleciconado.Nombre} ${autorSeleciconado.Apellido}");
      } else {
        print("Autor no encontrado");
      }
    } else {
      print("Libro no encontrado");
    }
  }

  void DeleteBook(String codigolibr) {
    for (var i = 0; i < Listlibros.length; i++) {
      if (Listlibros[i].Codigo == codigolibr) {
        Listlibros.removeAt(i);
        print("Libro eliminado con exito");
      } else {
        print("Libro no encontrado");
      }
    }
  }
}
