import 'dart:io';

class Tripulantes {
  String? Documento;
  String? Nombre;
  String? Apellido;

  Tripulantes.form(String Documento, String Nombre, String Apellido) {
    this.Documento = Documento;
    this.Nombre = Nombre;
    this.Apellido = Apellido;
  }
  Tripulantes() {}

  @override
  String toString() {
    return "\n Documen: ${this.Documento} \n  Nombre: ${this.Nombre} \n Apellido: ${this.Apellido}";
  }
}
