import 'package:flutter/material.dart';

/// Pantalla del Diccionario de Testigos del Tablero (Warning Lights).
/// TODO (fase 2 - visual): grid de íconos con búsqueda visual.
/// TODO (fase 3 - lógica): carga desde catálogo de WarningLight.
class WarningLightsScreen extends StatelessWidget {
  const WarningLightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Testigos del Tablero')),
      body: const Center(
        child: Text('Guía visual de testigos\n(pantalla en construcción)', textAlign: TextAlign.center),
      ),
    );
  }
}
