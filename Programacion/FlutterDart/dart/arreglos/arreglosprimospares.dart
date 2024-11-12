import 'dart:io';

// Función para verificar si un número es primo
bool esPrimo(int numero) {
  // Los números menores que 2 no son primos
  if (numero < 2) return false; 
  
  // Iterar desde 2 hasta la mitad del número
  for (var i = 2; i <= numero ~/ 2; i++) {
    // Si el número es divisible por i, no es primo
    if (numero % i == 0) return false; 
  }
  
  // Si no fue divisible por ningún número, es primo
  return true; 
}


void  main() {
  List <int> primos = [];
  List  <int> pares = [];

 // Iterar del 1 al 200
  for (var i = 1; i <= 200; i++) {
    // Verificar si el número es par
    if (i % 2 == 0) {
      pares.add(i); // Agregar a la lista de pares
    }
    // Verificar si el número es primo
    if (esPrimo(i)) {
      primos.add(i); // Agregar a la lista de primos
    }
  }

  // Solicitar al usuario que elija qué números imprimir
  print("¿Qué números deseas imprimir: Pares o Primos?");
  String? opcion = stdin.readLineSync();

  // Comparar la opción del usuario para imprimir pares
  if (opcion?.toLowerCase() == "pares") {
    print(pares); // Imprimir la lista de números pares
  } 
  // Comparar la opción del usuario para imprimir primos
  else if (opcion?.toLowerCase() == "primos") {
    print(primos); // Imprimir la lista de números primos
  } 
  // Manejar opciones no válidas
  else {
    print("Opción no válida.");
  }
}    




