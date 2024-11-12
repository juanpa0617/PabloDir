import 'dart:io';
import '../Models/ModelArtista.dart';

class Artistacontroller {
  List<Artista> listaArtistas = [];

  void createArtist() {
    print("Ingrese la cantidad de los Artistas");
    int cantidad = int.parse(stdin.readLineSync() ?? '');

    for (var i = 0; i < cantidad; i++) {
      Artista artista = Artista();  // Crear una nueva instancia para cada artista

      print("Ingrese el documento del artista");
      artista.documento = stdin.readLineSync() ?? '';
      print("Ingrese el nombre del artista");
      artista.nombre = stdin.readLineSync() ?? '';
      print("Ingrese el apellido del artista");
      artista.apellido = stdin.readLineSync() ?? '';
      print("Ingrese el talento del artista");
      artista.talento = stdin.readLineSync() ?? '';

      listaArtistas.add(artista);
    }
  }

  void ListArtist() {
    for (var i = 0; i < listaArtistas.length; i++) {
      print(
          "Información de los Artistas\nDocumento: ${listaArtistas[i].documento}\nNombre: ${listaArtistas[i].nombre}\nApellido: ${listaArtistas[i].apellido}\nTalento: ${listaArtistas[i].talento}\n");
    }
  }

  // Obtener el nombre del artista a partir del documento (código)
  String ObtenerNombreArtista(String documento) {
    for (var artista in listaArtistas) {
      if (artista.documento == documento) {
        return artista.nombre!;
      }
    }
    return 'Artista no encontrado';
  }
}

void main() {
  Artistacontroller controllerArtistas = Artistacontroller();
  controllerArtistas.createArtist();
  controllerArtistas.ListArtist();
}
