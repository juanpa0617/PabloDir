import 'dart:io';

void main() {
  List<Map<String, dynamic>> listaEstudiantes = [];

  while (true) {
    print("***************************************");
    print("Ingrese la opción que deseas hacer:");
    print("1. Agregar un nuevo estudiante");
    print("2. Listar estudiantes");
    print("3. Editar estudiante");
    print("4. Eliminar estudiante");
    print("5. Salir");
    print("***************************************");
    String opcion = stdin.readLineSync() ?? '';

    switch (opcion) {
      case '1':
        agregarEstudiante(listaEstudiantes);
        break;
      case '2':
        listarEstudiantes(listaEstudiantes);
        break;
      case '3':
        editarEstudiante(listaEstudiantes);
        break;
      case '4':
        eliminarEstudiante(listaEstudiantes);
        break;
      case '5':
        salir();
        return;
      default:
        print("\nOpción inválida. Por favor, seleccione una opción válida.");
    }
  }
}

/// Función para agregar un nuevo estudiante
void agregarEstudiante(List<Map<String, dynamic>> lista) {

  print ("\nIngrese la cantidad de estudiantes a registrar:");
  int cantidad = int.parse(stdin.readLineSync() ?? '');
  for (int i = 0; i < cantidad; i++) {
  print("Ingrese el documento del estudiante:");
  String documento = stdin.readLineSync() ?? '';
  print("Ingrese el nombre del estudiante:");
  String nombre = stdin.readLineSync() ?? '';
  print("Ingrese el apellido del estudiante:");
  String apellido = stdin.readLineSync() ?? '';
  print("Ingrese la edad del estudiante:");
  int edad = int.parse(stdin.readLineSync() ?? '');

  Map<String, dynamic> estudiante = {
    'documento': documento,
    'nombre': nombre,
    'apellido': apellido,
    'edad': edad,
  };


  lista.add(estudiante);
  print("\nEstudiante agregado con éxito.");
  }
}

/// Función para listar todos los estudiantes
void listarEstudiantes(List<Map<String, dynamic>> lista) {
  if (lista.isEmpty) {
    print("\nNo hay estudiantes registrados.");
  } else {
    print("\n=== LISTA DE ESTUDIANTES ===");
    for (int i = 0; i < lista.length; i++) {
      print("Estudiante ${i + 1}:");
      print("Documento: ${lista[i]["documento"]}");
      print("Nombre: ${lista[i]["nombre"]}");
      print("Apellido: ${lista[i]["apellido"]}");
      print("Edad: ${lista[i]["edad"]}");
      print("-------------------------");
    }
  }
}

/// Función para buscar estudiante por documento
Map<String, dynamic>? buscarEstudiante(List<Map<String, dynamic>> lista, String documento) {
  for (var estudiante in lista) {
    if (estudiante['documento'] == documento) {
      return estudiante;
    }
  }
  return null; 
}

/// Función para editar un estudiante existente
void editarEstudiante(List<Map<String, dynamic>> lista) {
  print("Ingrese el documento del estudiante a editar:");
  String documentoEditar = stdin.readLineSync() ?? '';

  Map<String, dynamic>? estudiante = buscarEstudiante(lista, documentoEditar);

  if (estudiante != null) {
    print("Ingrese el nuevo nombre del estudiante:");
    estudiante['nombre'] = stdin.readLineSync() ?? '';
    print("Ingrese el nuevo apellido del estudiante:");
    estudiante['apellido'] = stdin.readLineSync() ?? '';
    print("Ingrese la nueva edad del estudiante:");
    estudiante['edad'] = int.parse(stdin.readLineSync() ?? '');

    print("\nEstudiante actualizado con éxito.");
  } else {
    print("Estudiante no encontrado.");
  }
}

/// Función para eliminar un estudiante
void eliminarEstudiante(List<Map<String, dynamic>> lista) {
  print("Ingrese el documento del estudiante a eliminar:");
  String documentoEliminar = stdin.readLineSync() ?? '';

  Map<String, dynamic>? estudiante = buscarEstudiante(lista, documentoEliminar);

  if (estudiante != null) {
    lista.remove(estudiante);
    print("\nEstudiante eliminado con éxito.");
  } else {
    print("Estudiante no encontrado.");
  }
}


/// Función para salir del programa
void salir() {
  print("\n¡Hasta luego!");
}



