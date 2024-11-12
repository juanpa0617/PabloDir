import 'dart:io';

class Numeros {
  List<int> numeros = [];

  Numeros();

  Numeros.from(int numero) {
    this.numeros.add(numero);
  }

  void agregarNumero() {
    print("Ingrese la cantidad de numeros a registrar");
    int cantidad = int.parse(stdin.readLineSync() ?? '0');

    for (int i = 0; i < cantidad; i++) {
      print("Ingrese el número ${i + 1}");
      int numero = int.parse(stdin.readLineSync() ?? '');
      numeros.add(numero);
    }
  }

  void mostrarPares() {
    if (numeros.isEmpty) {
      print("No hay numeros para mostrar");
      return;
    }
    List<int> pares = [];

    for (var i = 0; i < numeros.length; i++) {
      if (numeros[i] % 2 == 0) {
        pares.add(numeros[i]);
      }
    }

    print("\nNumeros Pares***************");
    if (pares.isEmpty) {
      print("No hay numeros pares");
    } else {
      for (var i = 0; i < pares.length; i++) {
        print("Numero Par ${i + 1} = ${pares[i]}");
      }
    }
  }

  void mostrarImpares() {
    if (numeros.isEmpty) {
      print("No hay numeros para mostrar");
      return;
    }

    List<int> impares = [];

    for (var i = 0; i < numeros.length; i++) {
      if (numeros[i] % 2 != 0) {
        impares.add(numeros[i]);
      }
    }

    print("\nNumeros impares***************");
    if (impares.isEmpty) {
      print("No hay numeros impares para mostrar");
    } else {
      for (var i = 0; i < impares.length; i++) {
        print("Numero Impar ${i + 1} = ${impares[i]}");
      }
    }
  }

  void mostrarParesEImpares() {
    mostrarPares();
    mostrarImpares();
  }
}