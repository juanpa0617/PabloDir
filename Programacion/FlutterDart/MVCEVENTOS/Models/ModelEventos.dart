class Eventos {
  String? codigo;
  String? fecha;
  String? lugar;
  String? nombre;
  String? capacidad;
  String? artista;

  Eventos.form(String codigo, String fecha, String lugar, String nombre,
      String capacidad, String artista) {
    this.codigo = codigo;
    this.fecha = fecha;
    this.nombre = nombre;
    this.capacidad = capacidad;
    this.artista = artista;
  }
  Eventos() {}
  String toString() {
    return "\n Codigo: $codigo \n  Fecha: $fecha \n Lugar: $lugar \n Nombre: $nombre  \n  Capacidad: $capacidad \n Artista: $artista";
  }
}

void main() {}
