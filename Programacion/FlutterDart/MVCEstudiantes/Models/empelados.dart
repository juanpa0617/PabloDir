import '../Controller/EmpleadosController.dart';

class Empelados {
  int? documento ;
  String? nombre;
  String? apellido;
  int? rol;


Empelados(){

}
 Empelados.form(int  documento, String nombre, String apellido, int rol) {
  this.documento = documento;
  this.nombre = nombre;
  this.apellido = apellido;
  this.rol = rol;
 }
}


void main(){

}