import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Function(int) onTabTapped;
  final int selectedIndex;

  const BottomBar({super.key, required this.onTabTapped, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BottomAppBar(
      elevation: 8,
      color: Colors.white,
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.list,
              color: selectedIndex == 0 ? theme.colorScheme.secondary : theme.colorScheme.primary,
              size: 28,
            ),
            onPressed: () => onTabTapped(0),
            tooltip: 'Listar',
          ),
          IconButton(
            icon: Icon(
              Icons.home,
              color: selectedIndex == 1 ? theme.colorScheme.secondary : theme.colorScheme.primary,
              size: 28,
            ),
            onPressed: () => onTabTapped(1),
            tooltip: 'Inicio',
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: selectedIndex == 2 ? theme.colorScheme.secondary : theme.colorScheme.primary,
              size: 28,
            ),
            onPressed: () => onTabTapped(2),
            tooltip: 'Perfil',
          ),
        ],
      ),
    );
  }
}
