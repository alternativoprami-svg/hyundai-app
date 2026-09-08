import 'package:flutter/material.dart';

/// Pantalla del Decodificador de VIN.
/// TODO (fase 2 - visual): campo de entrada + resultado formateado.
/// TODO (fase 3 - lógica): parseo del VIN (posiciones año/planta/motor).
class VinDecoderScreen extends StatelessWidget {
  const VinDecoderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Decodificador de VIN')),
      body: const Center(
        child: Text('Ingreso y decodificación de VIN\n(pantalla en construcción)', textAlign: TextAlign.center),
      ),
    );
  }
}
