import 'package:flutter_application_1/Modelo/Tarea.dart';

abstract class TareasEstado {}

class TareasInicial extends TareasEstado {}

class TareasCargando extends TareasEstado {}

class TareasCargadas extends TareasEstado {
  final List<Tarea> tareas;
  TareasCargadas(this.tareas);
}

class TareasError extends TareasEstado {
  final String mensaje;
  TareasError(this.mensaje);
}
