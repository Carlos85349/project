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
  final pageViewController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text("Bienvenido, usuario"),
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            }),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      drawer: const MenuFragment(),
      body: PageView(
        //physics: const NeverScrollableScrollPhysics(),
        controller: pageViewController,
        children: const [
          InicioFragment(),
          NotificacionesFragment(),
          CalendarioFragment(),
        ],
        onPageChanged: (index) {
          currentPage = index;
          setState(() {});
        },
      ),
      bottomNavigationBar: BottomMenu(
        currentPage: currentPage,
        changePage: (index) {
          pageViewController.jumpToPage(index);
        },
      ),
    );
  }
}
