import 'dart:io';
import '../Controllers/invitadosController.dart';

class MenuInvit {
  int? opcion;
  ControllerInvitados invitados = ControllerInvitados();

  

  void pausa() {
    print('Presione Enter para continuar...');
    stdin.readLineSync();
  }

  void Minuevents() {
    do {
      print("***** Menú Invitados ********");
      print("1. Registrar Un Invitado evento");
      print("2. Listar los Invitados");
      print("3. Modificar un Invitado");
      print("4. Eliminar un Invitado");
      print("5. Regresar al Menú principal");
      print("6. Salir");
      print("Seleccione una opción:");

      opcion = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

      switch (opcion) {
        case 1:
          invitados.CreateInvitado();
          print("Invitado registrado exitosamente.");
          pausa(); 
          break;
        case 2:
          invitados.ListInvitados();
          pausa(); 
          break;
        case 3:
          print("Ingrese el documento del invitado a modificar:");
          String documento = stdin.readLineSync() ?? '';
          invitados.ActualizarInvitado(documento);
          print("Invitado modificado exitosamente.");
          pausa(); 
          break;
        case 4:
          print("Ingrese el documento del invitado a eliminar:");
          String documento2 = stdin.readLineSync() ?? '';
          invitados.EliminarInvitado(documento2);
          print("Invitado eliminado exitosamente.");
          pausa(); 
         
          break;
        case 5:
          print("Regresando al menú principal...");
          pausa(); 
          return;
        case 6:
          print("Saliendo del sistema...");
          pausa();
          break;
        default:
          print("Opción no válida.");
          pausa(); 
      }
    } while (opcion != 6);
  }
}

void main() {
  MenuInvit menuinvitados = MenuInvit();
  menuinvitados.Minuevents(); // Asegúrate de llamar al método para iniciar el menú
}
