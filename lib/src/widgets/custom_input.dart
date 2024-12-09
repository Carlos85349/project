import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.title,
    this.icon,
    this.controller,
    this.obscureText = false,
  });

  final String title;
  final IconData? icon;
  final TextEditingController? controller; // Nuevo parámetro
  final bool obscureText; // Para manejar campos con texto oculto, como contraseñas

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: TextField(
        controller: controller, // Asociamos el controlador
        obscureText: obscureText, // Manejo de texto oculto
        decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(color: Colors.grey),
          label: Text(title),
          border: InputBorder.none,
          prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
        ),
      ),
    );
  }
}