import 'package:flutter/material.dart';

class MenuFragment extends StatelessWidget {
  const MenuFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
