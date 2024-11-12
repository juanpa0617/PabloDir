import 'dart:io';
import '../Models/empelados.dart';
import 'RolesController.dart';
class empleados{
  final Empelados empelados = new Empelados();
 final Rolescontroller  rol = new Rolescontroller();
List<Map<String,dynamic>> ListEmpleado = [];


void CreateEmployee(){
  print("Ingrese la cantidad de estudiantes que quieres agregar");
  int cantidad = int.parse(stdin.readLineSync()?? '');

  for(int i =0; i < cantidad;i++){
    print("Ingrese el documento del empleado");
     empelados.documento = int.parse(stdin.readLineSync()?? '');
    print("Ingrese el nombre del empleado");
    empelados.nombre = stdin.readLineSync()??'';
    print("Ingrese el apellido del empleado");
     empelados.apellido = stdin.readLineSync()?? '';
    print( "Ingrese el rol que desees asignar");
    rol.ShowRoles();



  }
}
}

void main(){
  final empleados employee = new empleados();

}