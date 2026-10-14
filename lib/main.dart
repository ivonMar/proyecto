import 'package:flutter/material.dart';
import 'registrar_glucosa_screen.dart'; // Importa la pantalla creada anteriormente

void main() {
  runApp(const VidaEnBalanceApp());
}

class VidaEnBalanceApp extends StatelessWidget {
  const VidaEnBalanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vida en Balance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto', // Puedes cambiar la fuente si usas una personalizada
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B8E55), // Verde principal del diseño
          primary: const Color(0xFF6B8E55),
          surface: const Color(0xFFFAF8F5),
        ),
        scaffoldBackgroundColor: const Color(0xFFFAF8F5),
      ),
      home: const RegistrarGlucosaScreen(),
    );
  }
}