import 'package:flutter/material.dart';

class BotonMomento extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool seleccionado;
  final VoidCallback onTap;
  final Color colorPrincipal;
  final Color colorClaro;

  const BotonMomento({
    super.key,
    required this.icon,
    required this.label,
    required this.seleccionado,
    required this.onTap,
    required this.colorPrincipal,
    required this.colorClaro,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: seleccionado ? colorClaro : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: seleccionado ? colorPrincipal : Colors.grey.shade300,
            width: seleccionado ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: seleccionado ? colorPrincipal : Colors.black54,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: seleccionado ? FontWeight.bold : FontWeight.normal,
                color: seleccionado ? colorPrincipal : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}