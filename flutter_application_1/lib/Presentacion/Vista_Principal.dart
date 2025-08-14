import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/clima_cubit.dart';
import 'Bloc/tarea_bloc.dart';
import 'Bloc/tarea_event.dart';
import 'Bloc/tarea_state.dart';

class VistaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clima y Tareas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // Estado clima
            BlocBuilder<ClimaCubit, ClimaEstado>(
              builder: (context, estado) {
                if (estado.estaCargando) {
                  return CircularProgressIndicator();
                } else if (estado.error != null) {
                  return Text('Error clima: ${estado.error}');
                } else if (estado.clima != null) {
                  return Text(
                    'Clima en ${estado.clima!.ciudad}: ${estado.clima!.temperatura}°C, ${estado.clima!.descripcion}',
                    style: TextStyle(fontSize: 18),
                  );
                }
                return ElevatedButton(
                  onPressed: () {
                    context.read<ClimaCubit>().cargarClima();
                  },
                  child: Text('Cargar Clima'),
                );
              },
            ),

            SizedBox(height: 30),

            // Estado tareas
            BlocBuilder<TareasBloc, TareasEstado>(
              builder: (context, estado) {
                if (estado is TareasCargando) {
                  return CircularProgressIndicator();
                } else if (estado is TareasError) {
                  return Text('Error tareas: ${estado.mensaje}');
                } else if (estado is TareasCargadas) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: estado.tareas.length,
                      itemBuilder: (context, index) {
                        final tarea = estado.tareas[index];
                        return ListTile(
                          title: Text(tarea.titulo),
                          trailing: Checkbox(
                            value: tarea.completada,
                            onChanged: (_) {
                              context.read<TareasBloc>().add(
                                ToggleCompletada(tarea.id),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                }
                return Text('No hay tareas aún');
              },
            ),

            SizedBox(height: 10),

            // Botón para agregar tarea de ejemplo
            ElevatedButton(
              onPressed: () {
                final nuevaTarea = Tarea(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  titulo: 'Tarea nueva',
                  fechaCreacion: DateTime.now(),
                );
                context.read<TareasBloc>().add(AgregarTarea(nuevaTarea));
              },
              child: Text('Agregar Tarea'),
            ),
          ],
        ),
      ),
    );
  }
}
