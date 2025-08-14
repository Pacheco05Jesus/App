import 'package:flutter_bloc/flutter_bloc.dart';
import 'tarea_event.dart';
import 'tarea_state.dart';
import 'package:flutter_application_1/Modelo/Tarea.dart';

class TareasBloc extends Bloc<TareasEvent, TareasEstado> {
  List<Tarea> _tareas = [];

  TareasBloc() : super(TareasInicial()) {
    on<AgregarTarea>((event, emit) {
      emit(TareasCargando());
      _tareas.add(event.tarea);
      emit(TareasCargadas(List.from(_tareas)));
    });

    on<EliminarTarea>((event, emit) {
      emit(TareasCargando());
      _tareas.removeWhere((t) => t.id == event.id);
      emit(TareasCargadas(List.from(_tareas)));
    });

    on<ToggleCompletada>((event, emit) {
      emit(TareasCargando());
      _tareas = _tareas.map((t) {
        if (t.id == event.id) {
          return t.copyWith(completada: !t.completada);
        }
        return t;
      }).toList();
      emit(TareasCargadas(List.from(_tareas)));
    });
  }
}
