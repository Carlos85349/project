import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
    required this.changePage,
    required this.currentPage,
  });

  final Function(int) changePage;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPage,
      onTap: changePage, 
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