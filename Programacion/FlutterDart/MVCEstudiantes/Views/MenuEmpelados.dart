import 'dart:io';
import '../Controller/EmpleadosController.dart';
class MenuEmployees {
  final empleados employees = new empleados();
  void menuEmployee() {
    int opcion = 0;

    do {
      print("1.Crear un Empleado");
      print("2.Listar Empleados");
      print("3.Modificar Empleado");
      print("3.Eliminar Empleado");
      print("4.Salir");

      opcion = int.parse(stdin.readLineSync() ?? '');

      switch(opcion){
        case 1 :
        print("Crear un Empleado");
        employees.CreateEmployee();
        break;
        case 2 :
        print("Listar Empleados");
        break;
        case 3 :
        print("Modificar Empleado");
        break;
        case 4 :
        print("Salir");
        break;
        default:
        print("Opción no válida");
      }
    } while (opcion != 4);
  }
}

void main() {
  MenuEmployees menu = MenuEmployees();
  menu.menuEmployee();
}
