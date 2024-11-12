class Lends {
  int? codigo;
  String? estudiante;
  String? libro;
  String? fechaPrestamo;
  String? fechaDevolucion;
  bool? estado;

  Lends.form(int codigo, String estudiante, String libro, String fechaPrestamo,
      String fechaDevolucion, bool estado) {
    this.codigo = codigo;
    this.estudiante = estudiante;
    this.libro = libro;
    this.fechaPrestamo = fechaPrestamo;
    this.fechaDevolucion = fechaDevolucion;
    this.estado = estado;
  }
  Lends() {}

  String toString() {
    return "\n Codigo: $codigo \n Estudiante: $estudiante \n Libro: $libro \n fecha presamo: $fechaPrestamo \n fecha devolución $fechaDevolucion \n  Estado: $estado";
  }
}

void main() {}
