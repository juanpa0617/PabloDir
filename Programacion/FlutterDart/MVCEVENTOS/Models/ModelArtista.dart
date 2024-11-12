class Artista {
String ?documento;
String ?nombre ;
String ?apellido;
String ?talento ;


Artista.form(String documento,String nombre,String apellido ,String talento){
this.documento=documento;
this.nombre=nombre;
this.apellido=apellido;
this.talento =talento;

}
Artista(){

}
  String toString() {
    return "\n Documento: $documento \n  Nombre: $nombre \n Apellido: $apellido \n Talento: $talento";

  }
}


void main(){

}