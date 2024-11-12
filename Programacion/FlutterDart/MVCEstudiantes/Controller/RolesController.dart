import 'dart:io';
import '../Models/roles.dart';

class Rolescontroller {
  List<Map<String, dynamic>> rolesList = [];

  void CreateRol() {
    print("Ingrese la cantidad de roles que quiere registrar");
    int cantidad = int.parse(stdin.readLineSync() ?? '');
    for (int i = 0; i < cantidad; i++) {
      print("Ingrese el Codigo del rol");
      String code = stdin.readLineSync() ?? '';
      print("Ingrese el nombre del rol");
      String nombre = stdin.readLineSync() ?? '';

      rolesList.add({
        'code':code,
        'nombre':nombre
      });
      print("Rol Agregado exitosamente");
    }
  }

  void ShowRoles(){
    if (rolesList.isEmpty) {
      print("No hay roles registrados");
    }else{
      print("\n lista de roles registrado");
      for (var role in rolesList){
        print("Codigo: ${role['code']},  Nombre: ${role['nombre']}");

      }
    }
  }

  

}

void main() {
  final Rolescontroller roles = Rolescontroller();
  roles.CreateRol();
  roles.ShowRoles();
}
