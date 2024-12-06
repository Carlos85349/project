import 'package:flutter/material.dart';
import 'package:myapp/src/pages/fragments/calendario_fragment.dart';
import 'package:myapp/src/pages/fragments/inicio_fragment.dart';
import 'package:myapp/src/pages/fragments/menu_fragment.dart';
import 'package:myapp/src/pages/fragments/notificaciones_fragment.dart';
import 'package:myapp/src/widgets/bottom_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(); // PageController
  int currentPage = 0; // Índice actual del BottomNavigationBar

  void _onPageChanged(int index) {
    // Se llama cuando el PageView cambia de página
    setState(() {
      currentPage = index;
    });
  }

  void _onBottomNavigationTapped(int index) {
    // Se llama cuando se selecciona un elemento del BottomNavigationBar
    setState(() {
      currentPage = index;
    });
    // Cambiar la página del PageView
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text("Bienvenido, usuario"),
      ),
      drawer: const MenuFragment(),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged, // Sincroniza con el BottomNavigationBar
        children: const [
          InicioFragment(),
          NotificacionesFragment(),
          CalendarioFragment(),
        ],
      ),
      bottomNavigationBar: BottomMenu(
        currentPage: currentPage,
        changePage: _onBottomNavigationTapped, // Cambiar página
      ),
    );
  }
}