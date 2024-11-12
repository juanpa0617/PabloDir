import 'dart:io';

void tablas() {
  print('Ingrese un número para generar su tabla de multiplicar:');
  int numero = int.parse(stdin.readLineSync()!);

  print('Tabla de multiplicar del $numero:');
  for (int i = 1; i <= 10; i++) {
    print('$numero x $i = ${numero * i}');
  }
}

// void main() {
//   tablas(); 
// }