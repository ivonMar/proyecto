import 'package:flutter/material.dart';

class RegistrarGlucosaScreen extends StatefulWidget {
  const RegistrarGlucosaScreen({super.key});

  @override
  State<RegistrarGlucosaScreen> createState() => _RegistrarGlucosaScreenState();
}

class _RegistrarGlucosaScreenState extends State<RegistrarGlucosaScreen> {
  // Valor inicial de la glucosa
  int _nivelGlucosa = 112;

  // Momento de medición seleccionado (0: En ayunas, 1: Después de comer, 2: Antes de dormir)
  int _momentoSeleccionado = 0;

  // Paleta de colores basada en el diseño
  final Color _verdePrincipal = const Color(0xFF6B8E55); // Verde oliva del diseño
  final Color _verdeClaro = const Color(0xFFE8F0E3);
  final Color _fondo = const Color(0xFFFAF8F5);

  void _incrementar() {
    setState(() {
      _nivelGlucosa++;
    });
  }

  void _decrementar() {
    if (_nivelGlucosa > 0) {
      setState(() {
        _nivelGlucosa--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fondo,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: _verdePrincipal),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'Registrar glucosa',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
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
                    
                    // --- SECCIÓN: Contador / Indicador Circular ---
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: _verdePrincipal, width: 3),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline, size: 36),
                            color: _verdePrincipal,
                            onPressed: _decrementar,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$_nivelGlucosa',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const Text(
                                'mg/dL',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline, size: 36),
                            color: _verdePrincipal,
                            onPressed: _incrementar,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // --- Indicador de Estado (Rango) ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, color: _verdePrincipal, size: 18),
                        const SizedBox(width: 6),
                        const Text(
                          'Dentro del rango de referencia',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // --- SECCIÓN: Momento de la medición ---
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Momento de la medición',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _buildOpcionMomento(
                            index: 0,
                            icon: Icons.wb_twilight_rounded,
                            label: 'En ayunas',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildOpcionMomento(
                            index: 1,
                            icon: Icons.restaurant_rounded,
                            label: 'Después de comer',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildOpcionMomento(
                            index: 2,
                            icon: Icons.bedtime_rounded,
                            label: 'Antes de dormir',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // --- Botón Guardar registro ---
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
                          elevation: 0,
                        ),
                        onPressed: () {
                          // Acción para guardar el registro e ir a pantalla 04 "Glucosa registrada"
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Registro guardado correctamente'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.check),
                        label: const Text(
                          'Guardar registro',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // --- Barra Inferior de Navegación ---
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  // Widget selector de Momento de la medición
  Widget _buildOpcionMomento({required int index, required IconData icon, required String label}) {
    final bool seleccionado = _momentoSeleccionado == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _momentoSeleccionado = index;
        });
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: seleccionado ? _verdeClaro : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: seleccionado ? _verdePrincipal : Colors.grey.shade300,
            width: seleccionado ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: seleccionado ? _verdePrincipal : Colors.black54,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: seleccionado ? FontWeight.bold : FontWeight.normal,
                color: seleccionado ? _verdePrincipal : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para simular la barra inferior tal como se ve en la imagen
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
        Icon(
          icon,
          color: isSelected ? _verdePrincipal : Colors.grey,
          size: 22,
        ),
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