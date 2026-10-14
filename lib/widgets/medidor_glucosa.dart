import 'package:flutter/material.dart';

class MedidorGlucosa extends StatelessWidget {
  final int nivelGlucosa;
  final VoidCallback onIncrementar;
  final VoidCallback onDecrementar;
  final Color colorPrincipal;

  const MedidorGlucosa({
    super.key,
    required this.nivelGlucosa,
    required this.onIncrementar,
    required this.onDecrementar,
    required this.colorPrincipal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: colorPrincipal, width: 3),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline, size: 36),
            color: colorPrincipal,
            onPressed: onDecrementar,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$nivelGlucosa',
                style: const TextStyle(
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
            color: colorPrincipal,
            onPressed: onIncrementar,
          ),
        ],
      ),
    );
  }
}