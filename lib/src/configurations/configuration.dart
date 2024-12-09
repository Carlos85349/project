import 'package:flutter/material.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  ConfigurationPageState createState() => ConfigurationPageState();
}

class ConfigurationPageState extends State<ConfigurationPage> {
  // Variable que controla el estado de las notificaciones
  bool _isNotificationEnabled = true;

  // Método para manejar el cambio de estado de las notificaciones
  void _toggleNotification(bool value) {
    setState(() {
      _isNotificationEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Cambiar Nombre
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Cambiar Nombre"),
              onTap: () {
                // Acción para cambiar nombre
              },
            ),
            // Cambiar Correo
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text("Cambiar Correo"),
              onTap: () {
                // Acción para cambiar correo
              },
            ),
            // Cambiar Contraseña
                        ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Cambiar Contraseña"),
              onTap: () {
                // Acción para cambiar contraseña
              },
            ),
            // Cambiar Foto de Perfil
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text("Cambiar Foto de Perfil"),
              onTap: () {
                // Acción para cambiar foto de perfil
              },
            ),
            // Activar/desactivar Notificaciones
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notificaciones"),
              trailing: Switch(
                value: _isNotificationEnabled, // Usamos la variable de estado
                onChanged: _toggleNotification, // Acción para cambiar el estado
              ),
            ),
            // Cerrar sesión
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Cerrar Sesión"),
              onTap: () {
                // Lógica para cerrar sesión
                Navigator.pop(context);  // Aquí puedes colocar tu lógica de cerrar sesión
              },
            ),
          ],
        ),
      ),
    );
  }
}