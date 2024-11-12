import 'dart:io';



void main(){
  List<Map> Estudiantes=[];
  int opcion;

  do {
    print("\nBienvenido al Menú de Maestros");
    print("///////////////////////////////////");
    print("Ingresa lo que deseas hacer");
    print("1. Agregar un Estudiante");
    print("2. Editar un Estudiante");
    print("3. Eliminar un Estudiante");
    print("4. Listar todos los estudiantes");
    print("5. Salir");
    
    opcion = int.parse(stdin.readLineSync() ?? '0');

    switch (opcion) {
      case 1: 
        print("Agregando estudiante");
        CreateStudent(Estudiantes);
        break;
      case 2:
        print("Editando estudiante");
        break;
      case 3:
        print("Eliminando estudiante");
        break;
      case 4:
        print("Listando estudiantes");
        ListStudents(Estudiantes);
        break;
      case 5:
        print("Saliendo");
        break;
      default:
        print("Opción no válida");
    }
  } while (opcion != 5); 
}


void CreateStudent(lista){
  print("Ingrese la cantidad de estudiantes que vas a agregar");
  int cantidad=int.parse(stdin.readLineSync()?? '0');

  for (int i =0; i < cantidad; i++){
    print ("Ingrese el nombre del estudiante");
    String nombre = stdin.readLineSync() ?? '0';
    print("Ingrese la edad del estudiante");
    int edad = int.parse(stdin.readLineSync() ?? '0');
    print("Ingrese la nota del estudiante");
    double nota = double.parse(stdin.readLineSync()??'0');

    Map Object = {
      'nombre':nombre,
      'edad':edad,
      'nota':nota
    };

  lista.add(Object);

  }
}


void ListStudents(lista){
  if(lista.isEmpty){
    print("No hay estudiantes registrados");
  }else{
    for (var i =0 ; i < lista.length ; i++){
      print("*******************************");
      print("Estudiante: ${i+1}");
      print("Nombre: ${lista[i]['nombre']}");
      print("Edad: ${lista[i]['edad']}");
      print("Nota: ${lista[i]['nota']}");
      print("*****************************");
    }
  }
}

searchStudent(List){
  print("Ingrese el nombre del estudiante que busca");
  String nombre = stdin.readLineSync() ?? '0';
  for (var i =0 ; i < List.length ; i++){
    if(List[i]['nombre'] == nombre){
      print("Nombre: ${List[i]['nombre']}");
      print("Edad: ${List[i]['edad']}");
      print("Nota: ${List[i]['nota']}");
      }
  }

}

void EditStudent(Lista){
  print("Ingre el nombre del estudiante a editar");
  String nombreStudent = stdin.readLineSync()?? '0';
  if(nombreStudent.isEmpty){
    print("El estudiante no existe o es incorrecto");
  }else{
    for (var i =0 ; i < Lista.length ; i++){
       if (Lista [i]['nombre'] == nombreStudent);
       print("Ingrese el nuevo nombre del estudiante");
       String newNombre = stdin.readLineSync()?? '0';
       print("Ingrese la nueva edad del estudiante");
       int newEdad = int.parse(stdin.readLineSync()?? '0');
       print("Ingrese la nueva nota del estudiante");
       double newNota = double.parse(stdin.readLineSync()?? '0');
       
    }
  }
}

