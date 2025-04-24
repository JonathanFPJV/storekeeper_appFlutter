import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tema actual para mantener la coherencia con el resto de la aplicación
    final theme = Theme.of(context);
    
    return BottomAppBar(
      // Elevación sutil para dar profundidad
      elevation: 8,
      // Color de fondo que coincide con el tema
      color: Colors.white,
      // Forma redondeada en la parte superior para combinar con el AppBar
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
      ),
      // Altura adecuada para mejor usabilidad
      height: 64,
      // Padding para mejor apariencia
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.list,
              // Usamos el color primario del tema
              color: theme.colorScheme.primary,
              size: 28,
            ),
            onPressed: () {},
            tooltip: 'Listar',
          ),
          IconButton(
            icon: Icon(
              Icons.home,
              // Usamos el color secundario del tema para destacar
              color: theme.colorScheme.secondary,
              size: 28,
            ),
            onPressed: () {},
            tooltip: 'Inicio',
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined, // Versión outline del icono para un estilo más moderno
              color: theme.colorScheme.primary,
              size: 28,
            ),
            onPressed: () {},
            tooltip: 'Perfil',
          ),
        ],
      ),
    );
  }
}