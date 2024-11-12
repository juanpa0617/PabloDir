import 'dart:io';
import '../Models/ModelEventos.dart';
import '../Controller/artistaController.dart';

class EventosController {
  final Artistacontroller artistas = Artistacontroller();
  List<Eventos> eventosList = [];

  void createEventos() {
    print("Ingrese la cantidad de eventos que deseas registrar");
    int cantidad = int.parse(stdin.readLineSync() ?? '');
    for (var i = 0; i < cantidad; i++) {
      Eventos eventos = Eventos();

      print("Ingrese el codigo del evento");
      eventos.codigo = stdin.readLineSync() ?? '';
      print("Ingrese la fecha del evento");
      eventos.fecha = stdin.readLineSync() ?? '';
      print("Ingrese el lugar del evento");
      eventos.lugar = stdin.readLineSync() ?? '';
      print("Ingrese el nombre del evento");
      eventos.nombre = stdin.readLineSync() ?? '';
      print("Ingrese la capacidad del evento");
      eventos.capacidad = stdin.readLineSync() ?? '';
      print("*******Artista***************");
      artistas.ListArtist();  // Muestra la lista de artistas disponibles
      print("Ingrese el documento del artista para este evento");
      eventos.artista = stdin.readLineSync() ?? '';

      // Verificar si el artista ingresado existe
      String nombreArtista = artistas.ObtenerNombreArtista(eventos.artista!);
      if (nombreArtista == 'Artista no encontrado') {
        print("Código de artista no válido. Inténtelo de nuevo.");
        continue;  // Salta a la siguiente iteración si el código de artista es incorrecto
      }

      eventosList.add(eventos);
    }
  }

  void listEvents() {
    print("***********Lista de Eventos***********");
    for (var i = 0; i < eventosList.length; i++) {
      print(
          "\nCódigo del evento: ${eventosList[i].codigo}\nFecha: ${eventosList[i].fecha}\nLugar: ${eventosList[i].lugar}\nNombre: ${eventosList[i].nombre}\nCapacidad: ${eventosList[i].capacidad}\nArtista: ${artistas.ObtenerNombreArtista(eventosList[i].artista!)}");
    }
  }
}

void main() {
  EventosController eventos = EventosController();
  eventos.artistas.createArtist();  // Crear artistas antes de eventos
  eventos.createEventos();
  eventos.listEvents();
}
