import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el tema actual para mantener consistencia
    final theme = Theme.of(context);
    
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset('assets/images/logo.png'),
      ),
      title: Text(
        'Storekeeper',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onPrimary,
        ),
      ),
      backgroundColor: theme.colorScheme.secondary, // Usa el color secundario del tema
      elevation: 2, // Sutil elevación para dar profundidad
      scrolledUnderElevation: 4, // Aumenta elevación al hacer scroll
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined), // Icono outline es más moderno
          onPressed: () {},
          tooltip: 'Notificaciones',
        ),
        const SizedBox(width: 8), // Espacio al final para mejor apariencia
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}