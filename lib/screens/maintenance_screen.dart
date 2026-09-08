import 'package:flutter/material.dart';

/// Pantalla de Mantenimiento Programado y Recordatorios.
/// TODO (fase 2 - visual): checklist/calendario por km recorridos.
/// TODO (fase 3 - lógica): cálculo de próximos servicios y notificaciones.
class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mantenimiento')),
      body: const Center(
        child: Text('Calculadora de mantenimiento\n(pantalla en construcción)', textAlign: TextAlign.center),
      ),
    );
  }
}
