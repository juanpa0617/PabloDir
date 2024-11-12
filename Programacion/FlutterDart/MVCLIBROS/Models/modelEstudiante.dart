class Student {
  String? documento;
  String? nombre;
  String? apellido;
  String? correo;

  Student.form(String documento, String nombre, String apellido, String correo) {
    this.documento = documento;
    this.nombre = nombre;
    this.apellido = apellido;
    this.correo=correo;
  }

  Student(){
    
  }
  String toString(){
  return "documento: $documento, nombre: $nombre, apellido: $apellido, correo:";
}
}

void mian() {

  Student student = new Student();
}
