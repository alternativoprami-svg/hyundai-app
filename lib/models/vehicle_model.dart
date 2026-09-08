/// Representa la ficha técnica de un modelo Hyundai para un año específico.
/// Esta clase define la ESTRUCTURA de datos que usará toda la app.
/// La carga real desde JSON/Firebase se implementará en la fase de lógica.
class VehicleModel {
  final String modelo; // Ej: "Tucson"
  final int anio; // Ej: 2022
  final String motor; // Ej: "2.0L / 2.5L / Hybrid"
  final String aceiteTipo; // Ej: "5W-30 / 0W-20"
  final double capacidadAceiteLitros; // Ej: 4.2
  final String refrigeranteTipo;
  final String presionNeumaticosDelantera; // Ej: "33 psi"
  final String presionNeumaticosTrasera; // Ej: "33 psi"
  final String manualPdfPath; // Ruta local o URL al manual
  final String imagenPath;

  const VehicleModel({
    required this.modelo,
    required this.anio,
    required this.motor,
    required this.aceiteTipo,
    required this.capacidadAceiteLitros,
    required this.refrigeranteTipo,
    required this.presionNeumaticosDelantera,
    required this.presionNeumaticosTrasera,
    required this.manualPdfPath,
    required this.imagenPath,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      modelo: json['modelo'] as String,
      anio: json['anio'] as int,
      motor: json['motor'] as String,
      aceiteTipo: json['aceite_tipo'] as String,
      capacidadAceiteLitros: (json['capacidad_aceite_litros'] as num).toDouble(),
      refrigeranteTipo: json['refrigerante_tipo'] as String,
      presionNeumaticosDelantera: json['presion_neumaticos_delantera'] as String,
      presionNeumaticosTrasera: json['presion_neumaticos_trasera'] as String,
      manualPdfPath: json['manual_pdf_path'] as String,
      imagenPath: json['imagen_path'] as String,
    );
  }
}

/// Representa un testigo/luz de advertencia del tablero.
class WarningLight {
  final String id;
  final String nombre;
  final String descripcion;
  final String nivelUrgencia; // "critico", "advertencia", "informativo"
  final String imagenPath;
  final String accionRecomendada;

  const WarningLight({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.nivelUrgencia,
    required this.imagenPath,
    required this.accionRecomendada,
  });
}

/// Representa un ítem del plan de mantenimiento programado.
class MaintenanceItem {
  final String tarea; // Ej: "Cambio de aceite de motor"
  final int intervaloKm; // Ej: 10000
  final int? intervaloMeses; // Ej: 12 (opcional, lo que ocurra primero)

  const MaintenanceItem({
    required this.tarea,
    required this.intervaloKm,
    this.intervaloMeses,
  });
}
