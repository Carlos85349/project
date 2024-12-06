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
  final PageController pageController = PageController();
  int currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void _onBottomNavigationTapped(int index) {
    setState(() {
      currentPage = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text("Bienvenido, usuario"),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      drawer: MenuFragment(
          changePage: (index) {
          setState(() {
            currentPage = index; 
          });
          pageController.jumpToPage(index); 
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged, 
        children: const [
          InicioFragment(),
          NotificacionesFragment(),
          CalendarioFragment(),
        ],
      ),
      bottomNavigationBar: BottomMenu(
        currentPage: currentPage,
        changePage: _onBottomNavigationTapped,
      ),
    );
  }
}