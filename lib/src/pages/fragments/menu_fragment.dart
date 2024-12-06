import 'package:flutter/material.dart';
import 'package:myapp/src/configurations/logout.dart';

class MenuFragment extends StatelessWidget {
  const MenuFragment({
    super.key,
    required this.changePage,
  });

  final Function(int) changePage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Cabecera del Drawer con fondo que abarca todo el ancho
          const SizedBox(
            width: double.infinity, // Asegura que abarque todo el ancho
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green, // Fondo verde
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
                  SizedBox(height: 10),
                  Text(
                    "Menu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Opciones principales
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Inicio"),
                  onTap: () {
                    changePage(0); // Página de inicio
                    Navigator.pop(context); // Cerrar el Drawer
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text("Notificaciones"),
                  onTap: () {
                    changePage(1); // Página de notificaciones
                    Navigator.pop(context); // Cerrar el Drawer
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: const Text("Calendario"),
                  onTap: () {
                    changePage(2); // Página de calendario
                    Navigator.pop(context); // Cerrar el Drawer
                  },
                ),
                // Añade más opciones aquí si es necesario
              ],
            ),
          ),

          // Opciones al final
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Configuración"),
                onTap: () {
                  Navigator.pushNamed(context, '/confi'); // Cerrar el Drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Cerrar Sesión"),
                onTap: () {
                  Navigator.pop(context); // Cerrar el Drawer
                  LogOut.show(
                      context); // Mostrar el diálogo de cierre de sesión
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
