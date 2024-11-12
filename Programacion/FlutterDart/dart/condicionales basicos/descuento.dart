import 'dart:io';
void main() {
  double valor = 3.000000;
  int cantidad = 8;
  double descuento = 0;

  double subtotal = valor * cantidad;

  if (subtotal >= 3500000) {  
    descuento = 0.5;
    double total = subtotal * descuento;
    print("El descuento es: $total");  
  } else {
    print("No hay descuento. El subtotal es: $subtotal");
  }
}
