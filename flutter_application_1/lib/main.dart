import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/clima_cubit.dart';
import 'Presentacion/Vista_Principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClimaCubit(),
      child: MaterialApp(
        home: BlocBuilder<ClimaCubit, ClimaEstado>(
          builder: (context, state) {
            // ESTO SE REFRESCA CUANDO CAMBIA EL ESTADO
            return InitialForm();
          },
        ),
      ),
    );
  }
}
