import 'dart:io';
import '../Models/ModelEmbarcacion.dart';
import '../Controllers/tripulantesController.dart';
import '../Models/ModelTripulante.dart';

class ControllerEmbarcacion {
  List<Embaraciones> listaembarcacion = [];
  ControllerTripulantes _controllerTripulantes = ControllerTripulantes();

  void createEmbarcacion() {
    print("Ingrese la cantidad de embarcaciones que desea registrar");
    int cantidad = int.parse(stdin.readLineSync() ?? '');

    for (var i = 0; i < cantidad; i++) {
      Embaraciones embarcaciones = Embaraciones();

      print("Ingrese el Codigo");
      embarcaciones.Codigo = stdin.readLineSync() ?? '';
      print("Ingrese el Nombre");
      embarcaciones.Nombre = stdin.readLineSync() ?? '';
      print("Ingrese el LugarDestino");
      embarcaciones.LugarDestino = stdin.readLineSync() ?? '';
      print("Ingrese el Lugar Salida");
      embarcaciones.LugarSalida = stdin.readLineSync() ?? '';
      print("Ingrese la Fecha de Salida");
      embarcaciones.FechaSalida = stdin.readLineSync() ?? '';
      print("Ingrese la Cantidad Maxima");
      embarcaciones.CantidadMaxima = stdin.readLineSync() ?? '';

      print("Lista de los tripulantes registrados");
      _controllerTripulantes.ListTripulantes();

      print("Ingrese el documento del tripulante");
      String documentoTripulante = stdin.readLineSync() ?? '';
      
      Tripulantes? tripulante = _controllerTripulantes.obtenerTripulante(documentoTripulante);
      
      if (tripulante != null) {
        embarcaciones.tripulantes = tripulante;
        print("Tripulante agregado");
      } else {
        print("Tripulante no encontrado");
      }

      listaembarcacion.add(embarcaciones);
    }
  }

  void embaracionList() {
    for (var embarcacion in listaembarcacion) {
      print("Codigo: ${embarcacion.Codigo}");
      print("Nombre: ${embarcacion.Nombre}");
      print("Lugar Destino: ${embarcacion.LugarDestino}");
      print("Lugar Salida: ${embarcacion.LugarSalida}");
      print("Fecha de Salida: ${embarcacion.FechaSalida}");
      print("Cantidad Maxima: ${embarcacion.CantidadMaxima}");
      
      if (embarcacion.tripulantes != null) {
        print("Tripulante: ${embarcacion.tripulantes!.Nombre} ${embarcacion.tripulantes!.Apellido}");
      } else {
        print("No hay tripulante asignado");
      }
      
      print("-------------------------------");
    }
  }
}