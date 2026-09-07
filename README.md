# Hyundai Owner App (Flutter)

App para propietarios de vehículos Hyundai (2016–actualidad).

## Estructura del proyecto

```
hyundai_app/
├── pubspec.yaml              # Dependencias (PDF viewer, notificaciones, prefs, etc.)
├── lib/
│   ├── main.dart             # Punto de entrada + tema visual (azul Hyundai)
│   ├── models/
│   │   └── vehicle_model.dart    # VehicleModel, WarningLight, MaintenanceItem
│   ├── data/
│   │   └── models_catalog.dart   # Listas provisionales para los filtros (fase 1)
│   ├── screens/
│   │   ├── home_screen.dart          # Pantalla principal: menú + filtro ✅ LISTA
│   │   ├── technical_sheet_screen.dart   # Fichas técnicas (stub)
│   │   ├── warning_lights_screen.dart    # Testigos del tablero (stub)
│   │   ├── maintenance_screen.dart       # Mantenimiento (stub)
│   │   └── vin_decoder_screen.dart       # Decodificador VIN (stub)
│   ├── widgets/               # (vacío, para componentes reutilizables)
│   ├── services/              # (vacío, para lógica de carga de datos - fase 3)
│   └── utils/                 # (vacío, para helpers - ej. cálculo VIN)
└── assets/
    ├── data/                  # Aquí irá vehicles.json (fase 3)
    ├── images/models/         # Fotos de cada modelo
    ├── images/warning_lights/ # Íconos de testigos del tablero
    └── manuals/                # PDFs de manuales de usuario
```

## Cómo correrlo

```bash
flutter pub get
flutter run
```

## Estado actual (Fase 1: estructura + Fase 2 parcial: pantalla principal)

- ✅ Estructura de carpetas completa.
- ✅ `pubspec.yaml` con las dependencias que vamos a necesitar en las 3 fases.
- ✅ Modelos de datos (`VehicleModel`, `WarningLight`, `MaintenanceItem`) definidos.
- ✅ Pantalla principal (`home_screen.dart`) con:
  - Menú lateral (Drawer) navegable a las 4 secciones.
  - Filtro por Modelo + Año (dropdowns) que habilita el botón "Buscar ficha técnica".
  - Grid de accesos rápidos a cada sección.
- 🔲 Pantallas de detalle (fichas técnicas, testigos, mantenimiento, VIN): solo stubs visuales, pendientes de diseño completo (fase 2).
- 🔲 Conexión real a datos JSON/Firebase, visor de PDF, cálculo de mantenimiento y decodificación de VIN (fase 3).

## Próximos pasos sugeridos

1. **Fase 2 (pantallas visuales):** diseñar en detalle cada pantalla de destino:
   - Ficha técnica con tarjetas de especificaciones + botón "Ver manual (PDF)".
   - Grid de testigos con búsqueda por texto/color.
   - Checklist de mantenimiento con barra de progreso por km.
   - Formulario de VIN con validación de 17 caracteres.
2. **Fase 3 (lógica y datos):**
   - Crear `assets/data/vehicles.json` con la info real de cada modelo/año.
   - Crear `VehicleService` para cargar y filtrar el catálogo.
   - Implementar el algoritmo de decodificación de VIN (posiciones 10 = año, 11 = planta, etc.).
   - Programar notificaciones locales para recordatorios de mantenimiento.
