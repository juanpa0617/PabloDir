import 'dart:io';
import '../Models/modelEstudiante.dart';

class estudianteController {
  List<Student> estudiantes = [];

  void createStudent() {
    print("Ingrese la cantidad de estudiantes que deseas registrar");
    int cantidad = int.parse(stdin.readLineSync() ?? '0');

    for (int i = 0; i < cantidad; i++) {
      Student student = Student();

      print("Estudiante: ${i + 1}");
      print("Ingrese el documento del estudiante:");
      student.documento = stdin.readLineSync() ?? '';

      print("Ingrese el nombre del estudiante:");
      student.nombre = stdin.readLineSync() ?? '';

      print("Ingrese el apellido del estudiante:");
      student.apellido = stdin.readLineSync() ?? '';

      print("Ingrese el correo del estudiante:");
      student.correo = stdin.readLineSync() ?? '';

      estudiantes.add(student);
    }
  }

  void listStudents() {
    if (estudiantes.isEmpty) {
      print("No hay estudiantes registrados.");
    } else {
      print("Estudiantes registrados:");
      for (var element in estudiantes) {
        print(
            "Documento: ${element.documento}\nNombre: ${element.nombre}\nApellido: ${element.apellido}\nCorreo: ${element.correo}\n");
      }
    }
    print("\nPresione Enter para continuar...");
    stdin.readLineSync();
  }

  Student? searchStudent() {
    print("Ingrese el documento del estudiante que desees buscar");
    String documento = stdin.readLineSync() ?? '';
    if (documento.isEmpty) {
      print("No se encontraron estudiantes con el documento ingresado");
    } else {
      for (var element in estudiantes) {
        if (element.documento == documento) {
          print("--------------ESTUDIANTE ENCONTRADO----------------");
          print(
              "Documento: ${element.documento}\nNombre: ${element.nombre}\nApellido:  ${element.apellido}\nCorreo: ${element.correo}\n");
              return element;
        }
      }
    }
    print("\nPresione Enter para continuar...");
    stdin.readLineSync();
    return null;
  }

  void updateStudent() {
    Student? student = searchStudent();
    print("Ingrese el documento del estudiante que desees buscar");
    String documento = stdin.readLineSync() ?? '';
    if (documento.isEmpty) {
      print("No se encontraron estudiantes con el documento ingresado");
    } else {
      for (var element in estudiantes) {
        if (element.documento == documento) {
          print("--------------ESTUDIANTE ENCONTRADO----------------");
          print(
              "Documento: ${element.documento}\nNombre: ${element.nombre}\nApellido:  ${element.apellido}\nCorreo: ${element.correo}\n");
          print("Ingrese el Nuevo Nombre del estudiante");
          String nuevoDocumento = stdin.readLineSync() ?? '';
          element.documento = nuevoDocumento;
          print("Ingrese el Nuevo Nombre del estudiante");
          String nuevoNombre = stdin.readLineSync() ?? '';
          element.nombre = nuevoNombre;
          print("Ingrese el Nuevo Nombre del estudiante");
          String nuevoApellido = stdin.readLineSync() ?? '';
          element.apellido = nuevoApellido;
          print("Ingrese el Nuevo Nombre del estudiante");
          String nuevoCorreo = stdin.readLineSync() ?? '';
          element.correo = nuevoCorreo;
          print("Estudiante actualizado con exito");
        }
      }
    }
  }

  void removeStudent() {
    print("Ingrese el documento del estudiante a eliminar");
    String documento = stdin.readLineSync() ?? '';

    for (int i = 0; i < estudiantes.length; i++) {
      if (estudiantes[i].documento == documento) {
        print("Estudiante eliminado con exito"
            "\nDocumento: ${estudiantes[i].documento}\nNombre: ${estudiantes[i].nombre}\nApellido:  ${estudiantes[i].apellido}\nCorreo: ${estudiantes[i].correo}\n");
        estudiantes.removeAt(i);
        i--;
      }
    }
  }
}

void main() {
  estudianteController controllerStudents = estudianteController();
  controllerStudents.createStudent();
  controllerStudents.listStudents();
  controllerStudents.searchStudent();
  controllerStudents.updateStudent();
  controllerStudents.removeStudent();
}
