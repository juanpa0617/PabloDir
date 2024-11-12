import 'dart:io';

class Autores {
  int? Documento;
  String? Nombre;
  String? Apellido;
  String? Ciudad;

  Autores.form(String nombre, String apellido, String ciudad, int documento) {
    this.Nombre = nombre;
    this.Apellido = apellido;
    this.Ciudad = ciudad;
    this.Documento = documento;
  }
  Autores(){

  }

  String toString() {
    return "\n Nombre ${Nombre} \n Apellido ${Apellido} \n  Ciudad ${Ciudad} \n Documento ${Documento}";


  }
}
