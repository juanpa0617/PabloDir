import 'dart:io';


void main(){
   List<Map<String, dynamic>> lista = [];

  while (true) {
    print("***************************************");
    print("Ingrese la opción que deseas hacer");
    print("1. Agregar un nuevo estudiante");
    print("2. Listar estudiantes");
    print("3. Editar estudiante");
    print("4. Salir");
    print("***************************************");
    String opcion = stdin.readLineSync() ?? '';

    switch (opcion) {
      case '1':
        // Agregar estudiante
        print("Ingrese el documento del estudiante:");
        String documento = stdin.readLineSync() ?? '';
        print("Ingrese el nombre del estudiante:");
        String nombre = stdin.readLineSync() ?? '';
        print("Ingrese el apellido del estudiante:");
        String apellido = stdin.readLineSync() ?? '';
        print("Ingrese la edad del estudiante:");
        int edad = int.parse(stdin.readLineSync() ?? '');

        Map<String, dynamic> usuario = {
          'documento': documento,
          'nombre': nombre,
          'apellido': apellido,
          'edad': edad,
        };

        lista.add(usuario);
        print("\nEstudiante agregado con éxito.");
        break;

      case '2':
        // Listar estudiantes
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
        break;

      case '3':
        print("Ingrese el documento del estudiante a editar:");
        String documentoEditar = stdin.readLineSync() ?? '';

        bool encontrado = false;
        for (int i = 0; i < lista.length; i++) {
          if (lista[i]['documento'] == documentoEditar) {
            encontrado = true;
            print("Ingrese el nuevo nombre del estudiante:");
            String nuevoNombre = stdin.readLineSync() ?? '';
            print("Ingrese el nuevo apellido del estudiante:");
            String nuevoApellido = stdin.readLineSync() ?? '';
            print("Ingrese la nueva edad del estudiante:");
            int nuevaEdad = int.parse(stdin.readLineSync() ?? '');

            lista[i]['nombre'] = nuevoNombre;
            lista[i]['apellido'] = nuevoApellido;
            lista[i]['edad'] = nuevaEdad;

            print("\nEstudiante actualizado con éxito.");
            break;
          }
        }

        if (!encontrado) {
          print("Estudiante no encontrado.");
        }
        break;

      case '4':
        // Salir del programa
        print("\n¡Hasta luego!");
        return;

      default:
        print("\nOpción inválida. Por favor, seleccione una opción válida.");
    }
  }
}