import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
    required this.changePage,
    required this.currentPage,
  });

  final Function(int) changePage; // Callback para cambiar de página
  final int currentPage; // Página actual seleccionada

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPage, // Índice actual
      onTap: changePage, // Callback al cambiar de ítem
      selectedItemColor: Colors.teal[600],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'INICIO',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'NOTIFICACIONES',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'CALENDARIO',
        ),
      ],
    );
  }
}