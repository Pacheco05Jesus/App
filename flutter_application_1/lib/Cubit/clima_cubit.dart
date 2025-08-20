import 'package:flutter_bloc/flutter_bloc.dart';
import 'clima_state.dart';
import 'package:flutter_application_1/Modelo/Clima.dart';

class ClimaCubit extends Cubit<ClimaEstado> {
  ClimaCubit() : super(ClimaEstado());

<<<<<<< Updated upstream
  Future<void> cargarClima() async {
    emit(ClimaEstado(estaCargando: true));

    try {
      // Simulación de llamada a API
      await Future.delayed(Duration(seconds: 2));

      final climaEjemplo = Clima(
        temperatura: 25.0,
        descripcion: "Soleado",
        humedad: 40,
        velocidadViento: 10.5,
        ciudad: "Ciudad Ejemplo",
        horaActualizacion: DateTime.now(),
      );

      emit(ClimaEstado(clima: climaEjemplo));
    } catch (e) {
      emit(ClimaEstado(error: "Error al cargar el clima"));
    }
=======
  Future<void> cargarClima(String ciudad) async {
    emit(ClimaCargando());
    await Future.delayed(Duration(seconds: 2)); 

    
    emit(ClimaCargado(temperatura: 22, descripcion: "Soleado en $ciudad"));
>>>>>>> Stashed changes
  }
}
