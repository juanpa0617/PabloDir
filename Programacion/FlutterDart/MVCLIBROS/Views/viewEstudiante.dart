import 'dart:io';
import '../Controller/estudianteController.dart';
class menuEstudiante {
  void limpiarPantalla() {
    print(
        '\x1B[2J\x1B[0;0H'); // Esto limpia la pantalla y mueve el cursor al inicio
  }

  void menuestudiante() {
    int? opcion;
    estudianteController  estudiantecontroller = estudianteController();

    do {
      // limpiarPantalla();

      print("Bienvenido al menu de Gestión de Estudiantes");
      print("1. Ingresar datos de un estudiante");
      print("2. Listar estudiantes");
      print("3. Buscar estudiante");
      print("4. Modificar un estudiante ");
      print("5. Eliminar un estudiante");
      print("6. Volver al menú principal");
      print("7. Salir");
      opcion = int.parse(stdin.readLineSync() ?? '');

      switch (opcion) {
        case 1:
          print("Crear un estudiante");
          estudiantecontroller.createStudent();
          break;
        case 2:
          print("------------------------------------------------------------------");
          estudiantecontroller.listStudents();
          break;
        case 3:
        estudiantecontroller.searchStudent();
          break;
        case 4:
          print("------------------------------------------------------------------");
          estudiantecontroller.updateStudent();
          break;
        case 5:
          print("------------------------------------------------------------------");
          estudiantecontroller.removeStudent();
          break;
        case 6:
        print("Volver al menú principal");
          break;
        case 7:
        print("Adiós");
        break;
        default:
          print("Opción no válida");
      }
    } while (opcion != 6);
  }
}

void main() {
  menuEstudiante menuStudent = new menuEstudiante();
  menuStudent.menuestudiante();
}
