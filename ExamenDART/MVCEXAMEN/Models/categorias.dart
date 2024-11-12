import 'dart:io';

class Categoria {
  String? Codigo;
  String? Nombre;

  Categoria.form(String nombre, String codigo){
    this.Codigo = codigo;
    this.Nombre = nombre;
  }
  Categoria(){
  }

  @override
  String toString() {
    return "\nCodigo ${Codigo} \nNombre:${Nombre} ";
  }
  
}