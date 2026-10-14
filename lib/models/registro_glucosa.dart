class RegistroGlucosa {
  final String id;
  final int nivelGlucosa; // mg/dL
  final String momento;   // Ej: "En ayunas", "Después de comer", "Antes de dormir"
  final DateTime fecha;

  RegistroGlucosa({
    required this.id,
    required this.nivelGlucosa,
    required this.momento,
    required this.fecha,
  });

  // Determina si la glucosa está en un rango normal simulado (70 a 140 mg/dL)
  bool get estaEnRango => nivelGlucosa >= 70 && nivelGlucosa <= 140;
}

// Lista de datos simulados (Mock Data)
List<RegistroGlucosa> mockRegistrosGlucosa = [
  RegistroGlucosa(
    id: '1',
    nivelGlucosa: 112,
    momento: 'En ayunas',
    fecha: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  RegistroGlucosa(
    id: '2',
    nivelGlucosa: 95,
    momento: 'Antes de dormir',
    fecha: DateTime.now().subtract(const Duration(days: 1)),
  ),
];