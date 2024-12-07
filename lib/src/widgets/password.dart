import 'package:flutter/material.dart';

class ForgotPasswordDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _ForgotPasswordForm();
      },
    );
  }
}

class _ForgotPasswordForm extends StatefulWidget {
  @override
  State<_ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<_ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  bool _isButtonEnabled = false;

  void _validateForm() {
    setState(() {
      _isButtonEnabled = _isValidEmail(_emailController.text) &&
          _newPasswordController.text.length >= 8 &&
          _newPasswordController.text == _repeatPasswordController.text;
    });
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _newPasswordController.addListener(_validateForm);
    _repeatPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Recuperar Contraseña',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(169, 25, 178, 20),
                        ),
                        errorText: _emailController.text.isNotEmpty &&
                                !_isValidEmail(_emailController.text)
                            ? 'Por favor, introduce un correo válido'
                            : null,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _newPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Nueva contraseña',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(169, 25, 178, 20),
                        ),
                        errorText: _newPasswordController.text.isNotEmpty &&
                                _newPasswordController.text.length < 8
                            ? 'La contraseña debe tener al menos 8 caracteres'
                            : null,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _repeatPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Repita la contraseña',
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color.fromARGB(169, 25, 178, 20),
                        ),
                        errorText: _repeatPasswordController.text.isNotEmpty &&
                                _newPasswordController.text !=
                                    _repeatPasswordController.text
                            ? 'Las contraseñas no coinciden'
                            : null,
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: _isButtonEnabled
                        ? () {
                            Navigator.of(context).pop();
                          }
                        : null,
                    child: const Text('Aceptar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
