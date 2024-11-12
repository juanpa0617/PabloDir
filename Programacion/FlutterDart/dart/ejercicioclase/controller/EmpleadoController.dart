// import 'dart:io';

// class Empleado {
//   List<Map<String, dynamic>> empeleados = [];

//   int? documento;
//   String? nombre;
//   String? apellido;
//   String? Rol;

//   Empleado.from(documento, nombre, apellido, Rol) {
//     this.empeleados.add(documento);
//     this.empeleados.add(nombre);
//     this.empeleados.add(apellido);
//     this.empeleados.add(Rol);
//   }

//   void agregarEmpelad(List<Map<String, dynamic>> lista) {
//     print("Ingrese la cantidad de empelados a registrar");
//     int cantidad = int.parse(stdin.readLineSync() ?? '');
//     for (var i = 0; i < cantidad; i++) {
//       print("Ingrese el docuemtno del empleado");
//       int documento = int.parse(stdin.readLineSync() ?? '');
//       print("Ingrese el nombre del empelado");
//       String nombre = stdin.readLineSync() ?? '';
//       print("Ingrese el apellido del empleado");
//       String apellido = stdin.readLineSync() ?? '';
//       print("Ingrese el numero del rol");
//       String rol = stdin.readLineSync() ?? '';

//       Map<String, dynamic> empleado = {
//         'documento': documento,
//         'nombre': nombre,
//         'apellido': apellido,
//         'rol': rol
//       };
//       lista.add(empleado);
//     }
//   }

//   void mostrarEmpelados(List<Map<String, dynamic>> lista) {
//     if (lista.isEmpty) {
//       print("No hay hay empleados registrado");
//     } else {
//       print("Lista de empleados");
//       for (var i = 0; i < lista.length; i++) {
//         print("Empleado ${i + 1}");
//         print("Documento : ${lista[i]['documento']}");
//         print("Nombre : ${lista[i]['nombre']}");
//         print("Apellido : ${lista[i]['apellido']}");
//         print("Rol : ${lista[i]['rol']}");
//       }
//     }
//   }

//   Map<String, dynamic>? buscarEmpleado(
//       List<Map<String, dynamic>> lista, String documento) {
//     for (var empleado in lista) {
//       if (empleado['documento'] == documento) {
//         return empleado;
//       }
//     }
//     return null;
//   }

//   ActualizarEstudiante(List<Map<String, dynamic>> lista) {
//     Map<String, dynamic>? empelado = buscarEmpleado(lista, documentoEditar);
//   }
// }

// void main() {}
