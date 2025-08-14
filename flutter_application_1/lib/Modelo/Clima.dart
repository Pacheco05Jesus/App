class Clima {
  final double temperatura;        // En grados Celsius
  final String descripcion;        // Ej: "Soleado", "Nublado"
  final int humedad;               // Porcentaje (%)
  final double velocidadViento;   // En km/h
  final String ciudad;             // Nombre de la ciudad
  final DateTime horaActualizacion;

  Clima({
    required this.temperatura,
    required this.descripcion,
    required this.humedad,
    required this.velocidadViento,
    required this.ciudad,
    required this.horaActualizacion,
  });

  // Método opcional para crear instancia desde JSON (API)
  factory Clima.fromJson(Map<String, dynamic> json) {
    return Clima(
      temperatura: json['temp'].toDouble(),
      descripcion: json['weather'][0]['description'],
      humedad: json['humidity'],
      velocidadViento: json['wind_speed'].toDouble(),
      ciudad: json['name'],
      horaActualizacion: DateTime.now(),
    );
  }
}
