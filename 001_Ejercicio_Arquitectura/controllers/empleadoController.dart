import 'dart:io';

import '../models/empleadoModelo.dart';

class Empleadocontroller {
  List<Empleadomodelo> ListadoEmpleados = [];
  List<Map> ListadoRoles = [
    {"codigo": 123, "nombre": "Administrador"},
    {"codigo": 852, "nombre": "Operario"},
    {"codigo": 777, "nombre": "Contador"}
  ];

  // Instancia de Objetos

  void crear() {
    print("¿Cuantos emplados desea registrar?");
    int cantidad = int.parse(stdin.readLineSync() ?? '');
    for (var i = 0; i < cantidad; i++) {
      Empleadomodelo empleado = new Empleadomodelo();
      print("Documento del empleado");
      empleado.Documento = stdin.readLineSync();
      print("Nombre del empleado");
      empleado.Nombre = stdin.readLineSync();
      print("Apellidos del empleado");
      empleado.Apellidos = stdin.readLineSync();
      print("Rol del empleado");
      SelectRoles();
      print("\nDigite el código del rol");
      empleado.Rol = int.parse(stdin.readLineSync() ?? '');
      ListadoEmpleados.add(empleado);
    }
    print("Empleados registrados exitosamente\n");
  }

  void Listar() {
    for (int i = 0; i < ListadoEmpleados.length; i++) {
      print(
          "INFORMACIÓN DEL EMPLEADO\n\nNombre: ${ListadoEmpleados[i].Nombre}\nApellidos: ${ListadoEmpleados[i].Apellidos}\nDocumento: ${ListadoEmpleados[i].Documento}\nRol: ${ObtenerRol(ListadoEmpleados[i].Rol!)}\n");
    }
  }

  void Actualizar() {}

  void Eliminar() {}

  SelectRoles() {
    for (var i = 0; i < ListadoRoles.length; i++) {
      print("Código: ${i} Rol: ${ListadoRoles[i]['nombre']}");
    }
  }

  String ObtenerRol(int indice) {
    return ListadoRoles[indice]['nombre'];
  }
}
