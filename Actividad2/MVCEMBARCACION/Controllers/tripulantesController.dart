import 'dart:io';
import '../Models/ModelTripulante.dart';

  List<Tripulantes> listatripulantes = [];
class ControllerTripulantes {

  void createTripulantes() {
    print("¿Cuantos triuplantes deseas registrar?");
    int cantidad = int.parse(stdin.readLineSync() ?? '');

    for (var i = 0; i < cantidad; i++) {
      Tripulantes tripulantes = Tripulantes();
      print("Ingrese Documento");
      tripulantes.Documento = stdin.readLineSync() ?? '';
      print("Ingrese Nombre");
      tripulantes.Nombre = stdin.readLineSync() ?? '';
      print("Ingrese Apellido");
      tripulantes.Apellido = stdin.readLineSync() ?? '';

      listatripulantes.add(tripulantes);
    }
    print("Tripulanto registrado  con exito");
  }

  void ListTripulantes() {
    if (listatripulantes.isEmpty) {
      print("No hay tripulantes registrados");
    } else {
      print("Tripulantes registrados");
      for (var i = 0; i < listatripulantes.length; i++) {
        print("**************************************");
        print("Tripulante registrado ${listatripulantes.length}");
        print("Documento ${listatripulantes[i].Documento}");
        print("Nombre ${listatripulantes[i].Nombre}");
        print("Apellido ${listatripulantes[i].Apellido}");
      }
    }
  }

  Tripulantes? obtenerTripulante(String documento) {
    print("aqui documento ${documento}");
    for (var tripulante in listatripulantes) {
      if (tripulante.Documento == documento) {
        return tripulante;
      }
    }
    print("tripulante no encontrado");
    return null;
  }

  void UpdateTripulante(documento) {
    Tripulantes? tripulante = obtenerTripulante(documento);

    if (tripulante != null) {
      print("Ingrese el nuevo Documento");
      tripulante.Documento = stdin.readLineSync() ?? '';
      print("Ingrese el nombre tripulante");
      tripulante.Nombre = stdin.readLineSync() ?? '';
      print("Ingrese el apellido tripulante");
      tripulante.Apellido = stdin.readLineSync() ?? '';
      print("Tripulante actualizado con exito");
    }
  }

  void DeleteTriupulante(documento) {
    Tripulantes? tripulante = obtenerTripulante(documento);
    if (tripulante != null) {
      listatripulantes.remove(tripulante);
      print("Tripulante eliminado");
    }
  }
}
