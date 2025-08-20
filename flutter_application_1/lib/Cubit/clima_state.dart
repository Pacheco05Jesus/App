<<<<<<< Updated upstream
<<<<<<< Updated upstream
import 'package:flutter_application_1/Modelo/Clima.dart';
=======
=======

abstract class ClimaEstado {}
>>>>>>> Stashed changes

abstract class ClimaEstado {}
>>>>>>> Stashed changes

class ClimaEstado {
  final bool estaCargando;
  final Clima? clima;
  final String? error;

  ClimaEstado({
    this.estaCargando = false,
    this.clima,
    this.error,
  });
}
