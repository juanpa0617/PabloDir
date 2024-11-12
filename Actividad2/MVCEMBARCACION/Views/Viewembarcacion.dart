import 'dart:io';
import '../Controllers/embarcacionesController.dart';

class MenuEmbarcaciones {
  int? opcion;
  ControllerEmbarcacion embarcacion = ControllerEmbarcacion();
  void Menu() {
    do {
      print("Menu de  Tripulantes");
      print("1. Ingresar un Embarcación");
      print("2. Listrar Embarcación");
      print("3. Modificar un Embarcación");
      print("4. Eliminar un Embarcación");
      print("5. Volver al menu Embarcación");
      opcion = int.parse(stdin.readLineSync()??'');

      switch(opcion){

        case 1 :
        embarcacion.createEmbarcacion();
        break;
        case 2 :
        embarcacion.embaracionList();
        break;
        case 3 :
        print("Modificar");
        break;
        case 4 :
        print("Eliminar");
        break;
        case 5 :
        print("Return");
        return;
        default: 
        print("Opcion no valida");
      }
      
    } while (opcion != 5);
  }
}

void main (){
  MenuEmbarcaciones menuEmbarcaciones = MenuEmbarcaciones();
}
