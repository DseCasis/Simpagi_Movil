class Note {
  final int? id;
  final String cedula;
  final String nombre;
  final String apellido;
  final String correo;
  final String departamento;
  final String cargo;

  Note(
      {this.id,
      required this.cedula,
      required this.nombre,
      required this.apellido,
      required this.correo,
      required this.departamento,
      required this.cargo});

  Note.empty()
      : id = 0,
        cedula = '',
        nombre = '',
        apellido = '',
        correo = '',
        departamento = '',
        cargo = '';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cedula': cedula,
      'nombre': nombre,
      'apellido': apellido,
      'correo': correo,
      'departamento': departamento,
      'cargo': cargo
    };
  }

  // Aquí está el método fromMap
  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      cedula: map['cedula'],
      nombre: map['nombre'],
      apellido: map['apellido'],
      correo: map['correo'],
      departamento: map['departamento'],
      cargo: map['cargo'],
    );
  }
}
