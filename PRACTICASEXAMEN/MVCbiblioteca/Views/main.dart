import 'dart:io';
import '../Views/autores.dart';
import '../Views/libros.dart';
class menuPrincipal {
  int? opcional;
  menuAutores Autores  = menuAutores();
  menuLibros Libros  = menuLibros();


  void menu(){
 do {
     print("1. Gestion de Libros");
    print("2. Gestion de Autores");
    print("3. Salir");
    opcional = int.parse(stdin.readLineSync()??''); 

    switch(opcional){

      case 1 :
      Libros.LibrosMenu();
      break;
      case 2 :
      Autores.AutoresMenu();
      break;
      case 3 :
      print("Salir");
      default:
      print("Opción no válida");
      
    }
   
 } while (opcional !=3);
  }
  
}

void main(){
   menuPrincipal menuP = menuPrincipal();
  menuP.menu();
}