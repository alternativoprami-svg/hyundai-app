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

## Carpeta `android/`

Se agregó la carpeta `android/` completa, necesaria para que `flutter build apk` (y Codemagic) puedan compilar:

```
android/
├── build.gradle                 # Config a nivel proyecto
├── settings.gradle               # Declara módulos e incluye el plugin de Flutter
├── gradle.properties
├── gradlew / gradlew.bat         # Scripts del wrapper de Gradle
├── gradle/wrapper/gradle-wrapper.properties
├── .gitignore
└── app/
    ├── build.gradle               # applicationId, minSdk/targetSdk, firma de release
    └── src/
        ├── main/
        │   ├── AndroidManifest.xml
        │   ├── kotlin/com/hyundaiowner/app/MainActivity.kt
        │   └── res/                # íconos placeholder, splash screen, temas
        ├── debug/AndroidManifest.xml
        └── profile/AndroidManifest.xml
```

`applicationId` / `namespace`: `com.hyundaiowner.app` (cámbialo antes de publicar si quieres otro id).

### ⚠️ Paso obligatorio antes de subir a GitHub: `gradle-wrapper.jar`

Por seguridad no puedo generar el archivo binario `android/gradle/wrapper/gradle-wrapper.jar` (el `.jar` que ejecuta `gradlew`). Sin él, `./gradlew` no va a arrancar y Codemagic fallará igual. Genéralo una sola vez, localmente, con el Flutter SDK instalado:

```bash
cd hyundai_app
flutter build apk --debug
```

Al correr `flutter build apk` (o `flutter pub get` seguido de `cd android && gradle wrapper`), Flutter/Gradle descargan y crean automáticamente ese `.jar`. Después solo tienes que:

```bash
git add android/gradle/wrapper/gradle-wrapper.jar
git commit -m "Agregar gradle-wrapper.jar"
git push
```

Con eso el build de Codemagic debería funcionar. Si prefieres evitarte este paso manual, la alternativa más simple es correr `flutter create .` en la raíz del proyecto (con el Flutter SDK instalado) — eso regenera automáticamente toda la carpeta `android/` (incluido el `.jar`) de forma garantizada correcta, y puedes conservar tus carpetas `lib/` y `assets/` tal cual están.

### Íconos

Los íconos en `android/app/src/main/res/mipmap-*/ic_launcher.png` son un placeholder (círculo azul Hyundai con una "H"). Reemplázalos por tu logo real cuando lo tengas, o usa el paquete `flutter_launcher_icons` para generarlos automáticamente desde una sola imagen.

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
