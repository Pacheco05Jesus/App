class Tarea {
  final String id;            // ID única de la tarea
  final String titulo;        // Título de la tarea
  final String descripcion;   // Descripción opcional
  final bool completada;      // Si la tarea está hecha o no
  final DateTime fechaCreacion;
  final DateTime? fechaVencimiento; // Opcional

  Tarea({
    required this.id,
    required this.titulo,
    this.descripcion = '',
    this.completada = false,
    required this.fechaCreacion,
    this.fechaVencimiento,
  });

  // Método para copiar con cambios (útil para estados inmutables)
  Tarea copyWith({
    String? id,
    String? titulo,
    String? descripcion,
    bool? completada,
    DateTime? fechaCreacion,
    DateTime? fechaVencimiento,
  }) {
    return Tarea(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      completada: completada ?? this.completada,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      fechaVencimiento: fechaVencimiento ?? this.fechaVencimiento,
    );
  }
}
