import 'dart:io';
import '../Controller/RolesController.dart';

class MenuRoles {
  final  Rolescontroller _rolesController = Rolescontroller();

  void Menuroles() {
    int opcion = 0;

    do {
      print("1.Crear un Rol");
      print("2.Listar Roles");
      print("3.Modificar Rol");
      print("4.Eliminar Rol");
      print("5.Salir");

      opcion = int.parse(stdin.readLineSync() ?? '');

      switch(opcion){
        case 1 :
        print("Crear un Empleado");
        _rolesController.CreateRol();
        
        break;
        case 2 :
        print("Listar Empleados");
        _rolesController.ShowRoles();
        break;
        case 3 :
        print("Modificar Empleado");
        
        break;
        case 4 :
        print("Eliminar Empleado");
        break;
        case 5 :
        print("Salir");
        break;
        default:
        print("Opción no válida");
      }

      
    } while (opcion != 4);
  }
}

void main() {
   MenuRoles roles = MenuRoles();
  roles.Menuroles();
}
