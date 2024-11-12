import 'dart:io';
import '../Models/invitadoModel.dart';

class ControllerInvitados {
  List<Invitados> invitadosList = [];

  void CreateInvitado() {
    print("Ingrese la cantidad de invitados a Registrar");
    int cantidad = int.parse(stdin.readLineSync()!);

    for (var i = 0; i < cantidad; i++) {
      Invitados invitados = Invitados();
      print("Invitado ${i + 1}");
      print("Ingrese el documento del  invitado");
      invitados.Documento = stdin.readLineSync()!;
      print("Ingrese el nombre del invitado");
      invitados.Nombre = stdin.readLineSync()!;
      print("Ingrese el apellido del invitado");
      invitados.Apellido = stdin.readLineSync()!;
      print("************************************");

      invitadosList.add(invitados);
          print("Invitado registrado exitosamente");

    }
  }

  void ListInvitados() {
    if (invitadosList.isEmpty) {
      print("No hay invitados registrados");
    } else {
      for (var i = 0; i < invitadosList.length; i++) {
        print("Invitado ${i + 1}");
        print("**************************** ");

        print("Documento: ${invitadosList[i].Documento}");
        print("Nombre: ${invitadosList[i].Nombre}");
        print("Apellido: ${invitadosList[i].Apellido}");
      }
    }
  }

   Invitados? obtenerinvitado(String documento) {
    for (var invitado in invitadosList) {
      if (invitado.Documento == documento) {
        return invitado;
      }
    }
    print("Usuario no encontrado");
    return null;
  }

  void ActualizarInvitado(String documento) {
    Invitados? invitados = obtenerinvitado(documento);

    if (invitados != null) {
      print("Ingrese el nuevo Documento del invitado");
      invitados.Documento = stdin.readLineSync()!;
      print("Ingrese el nuevo nombre del invitado");
      invitados.Nombre = stdin.readLineSync()!;
      print("Ingrese el nuevo apellido del invitado");
      invitados.Apellido = stdin.readLineSync()!;
    }
  }

  void EliminarInvitado(String documento) {
    Invitados? invitados = obtenerinvitado(documento);

    if (invitados != null) {
      invitadosList.remove(invitados);
      print("Invitado Eliminado Exitosamente");
    }
  }
}

void main(){
    ControllerInvitados invitados = ControllerInvitados();

}
