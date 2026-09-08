import 'package:flutter/material.dart';
import '../data/models_catalog.dart';
import 'technical_sheet_screen.dart';
import 'warning_lights_screen.dart';
import 'maintenance_screen.dart';
import 'vin_decoder_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _modeloSeleccionado;
  int? _anioSeleccionado;

  void _buscarFicha() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TechnicalSheetScreen(
          modeloSeleccionado: _modeloSeleccionado,
          anioSeleccionado: _anioSeleccionado,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hyundai Owner')),
      drawer: _buildDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Encuentra tu vehículo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'Filtra por modelo y año para ver ficha técnica y manual.',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 16),
              _buildFilterCard(),
              const SizedBox(height: 24),
              const Text(
                'Accesos rápidos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildQuickAccessGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _modeloSeleccionado,
                    decoration: const InputDecoration(
                      labelText: 'Modelo',
                      border: OutlineInputBorder(),
                    ),
                    items: ModelsCatalog.modelos
                        .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _modeloSeleccionado = value),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    initialValue: _anioSeleccionado,
                    decoration: const InputDecoration(
                      labelText: 'Año',
                      border: OutlineInputBorder(),
                    ),
                    items: ModelsCatalog.anios
                        .map((a) => DropdownMenuItem(
                            value: a, child: Text(a.toString())))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _anioSeleccionado = value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: (_modeloSeleccionado != null &&
                        _anioSeleccionado != null)
                    ? _buscarFicha
                    : null,
                icon: const Icon(Icons.search),
                label: const Text('Buscar ficha técnica'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessGrid(BuildContext context) {
    final items = <_QuickAccessItem>[
      _QuickAccessItem(
        icon: Icons.description_outlined,
        label: 'Fichas Técnicas',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const TechnicalSheetScreen())),
      ),
      _QuickAccessItem(
        icon: Icons.warning_amber_rounded,
        label: 'Testigos del Tablero',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const WarningLightsScreen())),
      ),
      _QuickAccessItem(
        icon: Icons.build_outlined,
        label: 'Mantenimiento',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const MaintenanceScreen())),
      ),
      _QuickAccessItem(
        icon: Icons.qr_code_scanner,
        label: 'Decodificador VIN',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const VinDecoderScreen())),
      ),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.3,
      children: items
          .map((item) => _QuickAccessCard(item: item))
          .toList(),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF002C5F)),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Hyundai Owner',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Inicio'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Fichas Técnicas y Manuales'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TechnicalSheetScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.warning_amber_rounded),
            title: const Text('Testigos del Tablero'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const WarningLightsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.build_outlined),
            title: const Text('Mantenimiento y Recordatorios'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MaintenanceScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.qr_code_scanner),
            title: const Text('Decodificador de VIN'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const VinDecoderScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class _QuickAccessItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  _QuickAccessItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

class _QuickAccessCard extends StatelessWidget {
  final _QuickAccessItem item;
  const _QuickAccessCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: item.onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 34, color: const Color(0xFF002C5F)),
              const SizedBox(height: 8),
              Text(
                item.label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
