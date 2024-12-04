import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu(
      {super.key, required this.changePage, required this.currentPage});

  final void Function(int) changePage;
  final int currentPage;

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentPage,
      onTap: (index) {
        currentIndex = index;
        widget.changePage(currentIndex);
        setState(() {});
      },
      selectedItemColor: Colors.teal[600],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'INICIO',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
          ),
          label: 'NOTIFICACIONES',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_month,
          ),
          label: 'CALENDARIO',
        ),
      ],
    );
  }
}