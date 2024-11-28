import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey))
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: title,
            hintStyle: const TextStyle(color: Colors.grey),
            label: Text(title),
            border: InputBorder.none,
            ),
      ),
    );
  }
}