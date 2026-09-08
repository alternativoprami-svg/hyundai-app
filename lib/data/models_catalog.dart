/// Catálogo estático PROVISIONAL usado únicamente para poblar los filtros
/// de la pantalla principal en esta fase de estructura/visual.
/// En la fase de lógica y datos, esto se reemplazará por una carga real
/// desde assets/data/vehicles.json (o Firebase) a través de un servicio.
class ModelsCatalog {
  static const List<String> modelos = [
    'Tucson',
    'Santa Fe',
    'Elantra',
    'Kona',
    'IONIQ',
    'Creta',
    'Accent',
    'Venue',
    'Palisade',
  ];

  static const List<int> anios = [
    2016, 2017, 2018, 2019, 2020,
    2021, 2022, 2023, 2024, 2025, 2026,
  ];
}
