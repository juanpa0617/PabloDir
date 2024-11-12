class Events {
  String? Codigo;
  String? Nombre;
  String? Direccion;
  String? horayfecha;
  int? cantidadAsistentes;
  String? invitadoEspecial;
  Events() {}
  Events.form(String Codigo, String Nombre, String Direccion, String horayfecha,
      int cantidadAsistentes, String invitadoEspecial) {
    this.Codigo = Codigo;
    this.Nombre = Nombre;
    this.Direccion = Direccion;
    this.horayfecha = horayfecha;
    this.cantidadAsistentes = cantidadAsistentes;
    this.invitadoEspecial = invitadoEspecial;
  }
  String toString() {
    return '\n Codigo: $Codigo \n Nombre: $Nombre \n Dirección $Direccion \n Hora y Fecha $horayfecha \n Cantidad de Asistentes $cantidadAsistentes \n Invitado Especial: $invitadoEspecial';
  }
}
