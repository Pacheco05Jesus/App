import 'package:flutter_application_1/Modelo/Tarea.dart';

abstract class TareasEvent {}

class AgregarTarea extends TareasEvent {
  final Tarea tarea;
  AgregarTarea(this.tarea);
}

class EliminarTarea extends TareasEvent {
  final String id;
  EliminarTarea(this.id);
}

class ToggleCompletada extends TareasEvent {
  final String id;
  ToggleCompletada(this.id);
}
