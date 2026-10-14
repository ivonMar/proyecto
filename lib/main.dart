import 'package:flutter/material.dart';
import 'screens/registrar_glucosa_screen.dart';
import 'screens/glucosa_registrada_screen.dart';

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
        fontFamily: 'Roboto',
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAF8F5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B8E55),
          primary: const Color(0xFF6B8E55),
        ),
      ),
      // Definición del sistema de rutas nombrado para la navegación
      initialRoute: '/',
      routes: {
        '/': (context) => const RegistrarGlucosaScreen(),
        '/glucosa-registrada': (context) => const GlucosaRegistradaScreen(),
      },
    );
  }
}