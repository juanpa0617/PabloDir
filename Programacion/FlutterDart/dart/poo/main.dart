import 'dart:io';
import 'primosimpares.dart';

void main() {
  final numeros = new Numeros();
  int opcion;
  String continuar;
  
  do {
    print("\n=== Menú Básico POO ===");
    print("1. Ingresar números");
    print("2. Listar números pares");
    print("3. Listar números impares");
    print("4. Mostrar todos los números");
    print("5. Salir");
    print("Ingrese una opción: ");

    opcion = int.parse(stdin.readLineSync() ?? '0');

    switch(opcion) {
      case 1:
        print("\n=== Agregar Números ===");
        numeros.agregarNumero();
        break;
      case 2:
        print("\n=== Lista de Números Pares ===");
        numeros.mostrarPares();
        break;
      case 3:
        print("\n=== Lista de Números Impares ===");
        numeros.mostrarImpares();
        break;
      case 4:
        print("\n=== Lista de Todos los Números ===");
        numeros.mostrarParesEImpares();
        break;
      case 5:
        print("\n¡Hasta luego!");
        exit(0);
      default:
        print("\nOpción no válida");
    }

    print("\n¿Desea regresar al menú principal? (s/n): ");
    continuar = stdin.readLineSync()?.toLowerCase() ?? 'n';
    
    if (continuar != 's') {
      print("\n¡Hasta luego!");
      break;
    }
  } while (true);
}