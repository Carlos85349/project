import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.userController,
    required this.title,
    this.keyboardType = TextInputType.text, 
    this.iconPrefix, 
    this.iconSuffix,
  });

  final TextEditingController userController;
  final String title;
  final TextInputType keyboardType;
  final IconData? iconPrefix;
  final IconData? iconSuffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: userController,
      keyboardType: keyboardType,
      obscureText: keyboardType == TextInputType.visiblePassword,
      decoration: InputDecoration(
          hintText: 'Ingrese su $title',
          label: Text(title),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1000),
            ),
          ),
          prefixIcon: iconPrefix != null ? Icon(iconPrefix) : null,
          suffixIcon: iconSuffix != null ? Icon(iconSuffix) : null,
          ),
      maxLength: 15,
    );
  }
}