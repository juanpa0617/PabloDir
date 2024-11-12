import '../Models/ModelTripulante.dart';

class Embaraciones {
  String? Codigo;
  String? Nombre;
  String? LugarDestino;
  String? LugarSalida;
  String? FechaSalida;
  String? CantidadMaxima;
  Tripulantes? tripulantes; // Cambié a minúscula para ser consistente

  Embaraciones();

  Embaraciones.form(
    String codigo, 
    String nombre, 
    String lugardestino, 
    String lugarsalida,
    String fechasalida,
    String cantidadmaxima, 
    Tripulantes? tripulante // Cambiado a Tripulantes?
  ){
    this.Codigo = codigo;
    this.Nombre = nombre;
    this.LugarDestino = lugardestino;
    this.LugarSalida = lugarsalida;
    this.FechaSalida = fechasalida;
    this.CantidadMaxima = cantidadmaxima;
    this.tripulantes = tripulante; // Cambiado
  }

  @override
  String toString() {
    return "\n Codigo: ${this.Codigo} \n Nombre: ${this.Nombre} \n Lugar Destino: ${this.LugarDestino} \n Lugar Salida: ${this.LugarSalida} \n Fecha Salida ${this.FechaSalida} \n Cantidad Maxima ${this.CantidadMaxima}  \n Tripulantes ${this.tripulantes?.Nombre ?? 'Sin tripulante'}";
  }
}