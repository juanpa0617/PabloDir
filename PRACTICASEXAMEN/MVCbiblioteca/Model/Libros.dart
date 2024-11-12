import 'Autores.dart';
import 'dart:io';

class Libros {
  String? Codigo;
  String? Titulo;
  Autores? Autor;
  String? FechaPublicacion;

  Libros.form(String? codigo, String? titulo, Autores? autor,
      String? fechapublicacion) {
    this.Codigo = codigo;
    this.Titulo = titulo;
    this.Autor = autor;
    this.FechaPublicacion = fechapublicacion;
  }
  Libros(){
    
  }

  String toString() {
    return "\n Codigo ${Codigo}  \n Titulo ${Titulo} \n Autor ${Autor} \n Fecha Publicacion ${FechaPublicacion}";

    }
  }

