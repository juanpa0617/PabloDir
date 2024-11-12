class Empleadomodelo {
  String? Documento;
  String? Nombre;
  String? Apellidos;
  int? Rol;

  Empleadomodelo() {}

  Empleadomodelo.form(
      String documento, String nombre, String apellidos, int rol) {
    this.Documento = documento;
    this.Nombre = nombre;
    this.Apellidos = apellidos;
    this.Rol = rol;
  }

  String ImprimirEmpeado(String rol) {
    return "INFORMACIÓN DEL EMPLEADO\n\nNombre: ${this.Nombre}\nApellidos: ${this.Apellidos}\Documento: ${this.Documento}\nNombre: ${rol}";
  }
}
