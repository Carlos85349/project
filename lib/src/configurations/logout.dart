import 'package:flutter/material.dart';

class LogOut {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("¿Quieres cerrar sesión?"),
          content: const Text("Esta acción te desconectará de tu cuenta."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
                // Lógica para cerrar sesión
                // Navigator.pushReplacementNamed(context, '/login'); // Redirigir a pantalla de login
              },
              child: const Text("Cerrar sesión"),
            ),
          ],
        );
      },
    );
  }
}