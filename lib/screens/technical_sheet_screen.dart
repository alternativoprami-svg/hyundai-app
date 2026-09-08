import 'package:flutter/material.dart';

/// Pantalla de Fichas Técnicas y Manuales.
/// TODO (fase 2 - visual): listado/grid de resultados según filtro.
/// TODO (fase 3 - lógica): carga real desde JSON y visor de PDF.
class TechnicalSheetScreen extends StatelessWidget {
  final String? modeloSeleccionado;
  final int? anioSeleccionado;

  const TechnicalSheetScreen({
    super.key,
    this.modeloSeleccionado,
    this.anioSeleccionado,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fichas Técnicas')),
      body: Center(
        child: Text(
          modeloSeleccionado != null
              ? 'Ficha técnica de $modeloSeleccionado ${anioSeleccionado ?? ""}\n(pantalla en construcción)'
              : 'Selecciona un modelo y año desde el inicio.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
