class Invitados{

  String? Documento;
  String? Nombre;
  String? Apellido;

  Invitados.form(String documento, String nombre, String apellido) {
    this.Documento =documento;
    this .Nombre = nombre;
  }

  Invitados(){
    
  }
  
  String toString() {
return '\n Invitados: \n Documento: $Documento, \n  Nombre: $Nombre, \n Apellido: $Apellido';

  }
}