import 'dart:io';


void main(){
int opcion;
String ? continuar;
do {

 print("Bienvenido al Menú ");
 print("////////////////////////////////");
print("1.Ingresar un nuevo empleado");
print("2. Listar los empelados por su rol");
print("3. Actualizar un empleado");
print("4. Eliminar un empleado");
print("5. Salir");

opcion = int.parse(stdin.readLineSync()?? '');

switch(opcion){

  case 1 : 
  print("\n=== Agregar un empleado ===");

break;
case 2 : 
  print("\n=== Listar los empleado ===");

break;

case 3 : 
  print("\n=== Actualizar un empleado ===");
break;

case 4 : 
  print("\n=== Eliminar un empleado ===");
break;

case 5 : 
  print("\n=== Salir===");

  default:
  print("\n=== Opción no válida ===");
}
 print("\n¿Desea regresar al menú principal? (s/n): ");
    continuar = stdin.readLineSync()?.toLowerCase() ?? 'n';
    
    if (continuar != 's') {
      print("\n¡Hasta luego!");
      break;
    }
  
} while (true);}