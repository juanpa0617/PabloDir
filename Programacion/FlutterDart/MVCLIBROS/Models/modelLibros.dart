
class Books{

  int? codigo;
  String? titulo;
  String? autor;


 Books.form(int codigo, String titulo, String autor){
  
  this.codigo = codigo;
  this.titulo = titulo;
  this.autor = autor;
 } 

 
  String toString() {
    
    return "\n Codigo: $codigo \n Titulo: $titulo, Autor: $autor";

  }
}

void main(){

}