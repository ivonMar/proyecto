import 'package:flutter/material.dart';
import '../models/registro_glucosa.dart';
import '../widgets/medidor_glucosa.dart';
import '../widgets/boton_momento.dart';

class RegistrarGlucosaScreen extends StatefulWidget {
  const RegistrarGlucosaScreen({super.key});

  @override
  State<RegistrarGlucosaScreen> createState() => _RegistrarGlucosaScreenState();
}

class _RegistrarGlucosaScreenState extends State<RegistrarGlucosaScreen> {
  int _nivelGlucosa = 112;
  int _momentoSeleccionado = 0;

  final List<String> _opcionesMomento = [
    'En ayunas',
    'Después de comer',
    'Antes de dormir',
  ];

  final Color _verdePrincipal = const Color(0xFF6B8E55);
  final Color _verdeClaro = const Color(0xFFE8F0E3);

  void _guardarRegistro() {
    final nuevoRegistro = RegistroGlucosa(
      id: DateTime.now().toString(),
      nivelGlucosa: _nivelGlucosa,
      momento: _opcionesMomento[_momentoSeleccionado],
      fecha: DateTime.now(),
    );

    // Agregar al listado de Mock Data
    mockRegistrosGlucosa.add(nuevoRegistro);

    // Navegación a la pantalla de confirmación usando Navigator.pushNamed
    Navigator.pushNamed(
      context,
      '/glucosa-registrada',
      arguments: nuevoRegistro,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: _verdePrincipal),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Registrar glucosa',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    MedidorGlucosa(
                      nivelGlucosa: _nivelGlucosa,
                      colorPrincipal: _verdePrincipal,
                      onIncrementar: () => setState(() => _nivelGlucosa++),
                      onDecrementar: () {
                        if (_nivelGlucosa > 0) setState(() => _nivelGlucosa--);
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, color: _verdePrincipal, size: 18),
                        const SizedBox(width: 6),
                        const Text(
                          'Dentro del rango de referencia',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Momento de la medición',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: BotonMomento(
                            icon: Icons.wb_twilight_rounded,
                            label: _opcionesMomento[0],
                            seleccionado: _momentoSeleccionado == 0,
                            colorPrincipal: _verdePrincipal,
                            colorClaro: _verdeClaro,
                            onTap: () => setState(() => _momentoSeleccionado = 0),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BotonMomento(
                            icon: Icons.restaurant_rounded,
                            label: _opcionesMomento[1],
                            seleccionado: _momentoSeleccionado == 1,
                            colorPrincipal: _verdePrincipal,
                            colorClaro: _verdeClaro,
                            onTap: () => setState(() => _momentoSeleccionado = 1),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BotonMomento(
                            icon: Icons.bedtime_rounded,
                            label: _opcionesMomento[2],
                            seleccionado: _momentoSeleccionado == 2,
                            colorPrincipal: _verdePrincipal,
                            colorClaro: _verdeClaro,
                            onTap: () => setState(() => _momentoSeleccionado = 2),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _verdePrincipal,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: _guardarRegistro,
                        icon: const Icon(Icons.check),
                        label: const Text(
                          'Guardar registro',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, 'Inicio', true),
          _buildNavItem(Icons.bar_chart_outlined, 'Historial', false),
          _buildNavItem(Icons.restaurant_outlined, 'Alimentación', false),
          _buildNavItem(Icons.settings_outlined, 'Ajustes', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isSelected ? _verdePrincipal : Colors.grey, size: 22),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? _verdePrincipal : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}