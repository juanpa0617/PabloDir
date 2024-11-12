import 'dart:io';
import 'categorias.dart';

class Productos {
  String? Codigo;
  String? Nombre;
  int? Stock;
  double? Precio;
  Categoria? categoria;

  Productos.form(String nombre, String codigo, int stock, double precio, Categoria? categoria){
    this.Codigo = codigo;
    this.Nombre = nombre;
    this.Stock = stock;
    this.Precio = precio;
    this.categoria= categoria;
  }
  Productos(){
  }

  @override
  String toString() {
    return "\nCodigo: ${Codigo} \nNombre:${Nombre} n\Stock: ${Stock} n\ Precio${Precio} Categoria:${categoria}";
  }
  
}