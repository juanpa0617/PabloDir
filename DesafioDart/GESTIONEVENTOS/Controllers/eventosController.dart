import 'dart:io';
import '../Controllers/invitadosController.dart';
import '../Models/eventsModel.dart';
import '../Models/invitadoModel.dart';

class ControllerEventos {
  List<Events> listEventos = [];
  final ControllerInvitados invitados;
  ControllerEventos(this.invitados);

  void crearEvento() {
    print("Ingrese la cantidad de eventos a registrar");
    int cantidad = int.parse(stdin.readLineSync()!);

    for (var i = 0; i < cantidad; i++) {
      Events evento = Events();
      print("Ingrese el codigo del evento");
      evento.Codigo = stdin.readLineSync() ?? '';
      print("Ingrese el nombre del evento");
      evento.Nombre = stdin.readLineSync() ?? '';
      print("Ingrese la direccion del evento");
      evento.Direccion = stdin.readLineSync() ?? '';
      print("Ingrese la fecha del evento");
      evento.horayfecha = stdin.readLineSync() ?? '';
      print("Ingrese la cantidad de asistentes");
      evento.cantidadAsistentes = int.parse(stdin.readLineSync()!);
      print("Lista de invitados disponibles");
      invitados.ListInvitados();

      if (invitados.invitadosList.isNotEmpty) {
        print("Ingrese el documento del invitado especial");
        String documentoInvitado = stdin.readLineSync() ?? '';
        Invitados? invitadoEspecial =
            invitados.obtenerinvitado(documentoInvitado);

        if (invitadoEspecial != null) {
          evento.invitadoEspecial =
              "${invitadoEspecial.Nombre}  ${invitadoEspecial.Apellido}";
          print("Invitado especial agregado exitosamente.");
        } else {
          print("Invitado especial no encontrado");
          evento.invitadoEspecial = "Sin invitado";
        }
      }
      listEventos.add(evento);
      print("Evento agreado exitosamente");
    }
  }

  void listarEventos() {
    for (var i = 0; i < listEventos.length; i++) {
      print("Codigo del evento: ${listEventos[i].Codigo}");
      print("Nombre del evento: ${listEventos[i].Nombre}");
      print("Direccion del evento: ${listEventos[i].Direccion}");
      print("Fecha del evento: ${listEventos[i].horayfecha}");
      print("Cantidad de asistentes: ${listEventos[i].cantidadAsistentes}");
      print("Invitado especial: ${listEventos[i].invitadoEspecial}");
      print("------------------------------------------------");
    }
  }
}

void main(){
  ControllerEventos eventos = ControllerEventos(this.invitados);
  
}
