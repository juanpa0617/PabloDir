import 'dart:io';

class menuPrestamos {
  
  void limpiarPantalla() {
    print('\x1B[2J\x1B[0;0H');  // Esto limpia la pantalla y mueve el cursor al inicio
  }

  void menuprestamos(){
int ? opcion;

  do {
    limpiarPantalla();
    print("Bienvenido al menu de Gestión de prestamos");
    print("1. Ingresar datos de un prestamos");
    print("2. Listar prestamos");
    print("3. Buscar prestamos");
    print("4. Modificar un prestamos ");
    print("5. Eliminar un prestamos");
    print("6. Salir");
    opcion = int.parse(stdin.readLineSync()??'');

    switch(opcion){

      case 1: 
      print("Crear un prestamos");
      break;
      case 2: 
      print("Listar los prestamos");
      break;
      case 3:
      print("Buscar un prestamos");
      break;
      case 4:
      print("Actualizar un prestamos");
      break;
      case 5:
      print("Eliminar un prestamos");
      break;
      case 6:
      print("Salir del Programa");
      break;
      default:
      print("Opción no válida");
      
    }
    
  } while (opcion != 6);
}

}

void main(){

  menuPrestamos  menuprestamos = new menuPrestamos();
  menuprestamos.menuprestamos();


}