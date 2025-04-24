import 'package:flutter/material.dart';
import 'view/topbar.dart';
import 'view/bottombar.dart';
import 'view/storekeeper_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos colores principales para mantener consistencia
    const primaryColor = Color(0xFF40B7AD);
    const secondaryColor = Color(0xFF6A8EEA);
    const textColor = Color(0xFF4A4A4A);
    const backgroundColor = Color(0xFFF5F5F5);

    return MaterialApp(
      title: 'Storekeeper App',
      theme: ThemeData(
        // Usa Material 3 para componentes modernos
        useMaterial3: true,
        // Genera un esquema de colores armonioso
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          secondary: secondaryColor,
          onBackground: textColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        // Mantiene la fuente Inter configurada
        fontFamily: 'Inter',
        // Estilos de texto más refinados
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
        // Estilo global para botones elevados
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // Estilo global para tarjetas
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
        ),
        // Estilo global para inputs
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: primaryColor.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: primaryColor, width: 2),
          ),
        ),
      ),
      home: const StorekeeperPage(),
      debugShowCheckedModeBanner: false, // Elimina la etiqueta de debug
    );
  }
}

class StorekeeperPage extends StatelessWidget {
  const StorekeeperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: const StorekeeperBody(),
      bottomNavigationBar: const BottomBar(),
    );
  }
}