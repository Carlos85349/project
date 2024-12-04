import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.lightGreen,
                        child: Icon(
                          Icons.pets,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Menu",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  )),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Inicio"),
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text("Buscar"),
              ),
              ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text("Calendario"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Configuracion"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Cerrar Sesion"),
              ),
            ],
          ),
        ),
        body: PageView(
          children: const [
            Center(child: Text("Pagina 1")),
            Center(child: Text("Pagina 2")),
            Center(child: Text("Pagina 3")),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Calendario"),
          ],
        ));
  }
}
