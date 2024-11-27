import 'package:flutter/material.dart';
import 'package:myapp/src/widgets/custom_input.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userController = TextEditingController(text: 'admin');
  final passwordController = TextEditingController(text: 'admon');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomInput(
                title: 'usuario',
                userController: userController,
                iconPrefix: Icons.person,
              ),
              CustomInput(
                title: 'contraseña',
                userController: passwordController,
                keyboardType: TextInputType.visiblePassword,
                iconPrefix: Icons.lock,
                iconSuffix: Icons.remove_red_eye,
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text('Iniciar Sesion'),
              )
            ],
          ),
        ),
      ),
    );
  }
}