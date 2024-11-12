import 'dart:io';

class Estudiante {
  String? nombre;
  String? apellido;
  int? edad;
  String? curso;
  double? nota;

  Estudiante() {}

  Estudiante.form(
      String nombre, String apellido, int edad, String curso, double nota) {
    this.nombre = nombre;
    this.apellido = apellido;
    this.edad = edad;
    this.curso = curso;
    this.nota = nota;
  }
  String toString() {
    return " Nombre: $nombre \n Apellido: $apellido \n Edad: $edad \n Curso $curso  \n Nota: $nota";
  }
}

String calcularnota( double nota){
  if(nota  >= 3.5 && nota <= 5){
    return "Nota Aprobada";
    }else{
      return "Nota Desaprobada";
      }

}


void main() {

  List<Estudiante> estudiantes = [];

  print("Ingrese la cantidad de estudiantes a registrar");
  int cantidad = int.parse(stdin.readLineSync() ?? '0');
  final estudiante = new Estudiante();





  for (int i = 1; i <= cantidad; i++) {
    print("Estudiante $i");
    print("Ingrese el nombre del estudiante");
    estudiante.nombre = stdin.readLineSync();
    print("Ingrese el apellido del estudiante");
    estudiante.apellido = stdin.readLineSync();
    print("Ingrese la edad del estudiante");
    estudiante.edad = int.parse(stdin.readLineSync() ?? '0');
    print("Ingrese el curso del estudiante");
    estudiante.curso = stdin.readLineSync();
    print("Ingrese la nota del estudiante");
    estudiante.nota = double.parse(stdin.readLineSync() ?? '0');

  estudiantes.add(estudiante);

  
  }

print("Lista de los estudiantes");
  for (var i = 0; i < estudiantes.length; i++) {
    print("\nEstudiante ${i + 1}:");
    print(estudiantes[i]);
    if (estudiantes[i].nota != null){
      print("Estado ${calcularnota(estudiantes[i].nota!)}");
    }    
  }
}