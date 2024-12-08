import 'package:flutter/material.dart';
import 'package:myapp/src/widgets/custom_input.dart';
import 'package:provider/provider.dart';
import 'package:myapp/src/providers/login_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controladores para los campos de registro
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();
    final TextEditingController _petNameController = TextEditingController();
    final TextEditingController _petSpeciesController = TextEditingController();
    final TextEditingController _petBreedController = TextEditingController();
    final TextEditingController _petAgeController = TextEditingController();
    final TextEditingController _petGenderController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volver a la página de inicio de sesión
          },
        ),
        title: const Text("Registro"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0),
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.green,
          Colors.teal,
          Colors.blue,
        ])),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 0,
                  ),
                  Text(
                    "Pets App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                    height: 0,
                  ),
                  Text(
                    "Bienvenido a tu app de mascotas",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "Registra tus datos",
                    style: TextStyle(
                        color: Color.fromRGBO(163, 233, 84, 0.612),
                        fontSize: 25,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(12, 164, 157, 0.552),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              CustomInput(
                                title: 'Nombre Completo ',
                                icon: Icons.person,
                                controller: _nameController,
                              ),
                              CustomInput(
                                title: 'Número de teléfono',
                                icon: Icons.phone,
                                controller: _phoneController,
                              ),
                              CustomInput(
                                title: 'Correo electrónico',
                                icon: Icons.email,
                                controller: _emailController,
                              ),
                              CustomInput(
                                title: 'Contraseña',
                                icon: Icons.password,
                                obscureText: true,
                                controller: _passwordController,
                              ),
                              CustomInput(
                                title: 'Confirmar Contraseña',
                                icon: Icons.password,
                                obscureText: true,
                                controller: _confirmPasswordController,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 25,
                                child: Text("Datos de tu mascota:"),
                              ),
                              CustomInput(
                                title: 'Nombre de mascota',
                                icon: Icons.pets,
                                controller: _petNameController,
                              ),
                              CustomInput(
                                title: 'Especie',
                                icon: Icons.pets,
                                controller: _petSpeciesController,
                              ),
                              CustomInput(
                                title: 'Raza',
                                icon: Icons.category,
                                controller: _petBreedController,
                              ),
                              CustomInput(
                                title: 'Edad',
                                icon: Icons.calendar_today,
                                controller: _petAgeController,
                              ),
                              CustomInput(
                                title: 'Sexo',
                                icon: Icons.transgender,
                                controller: _petGenderController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Llamar al provider para registrar el usuario
                            final loginProvider = Provider.of<LoginProvider>(context, listen: false);
                            loginProvider.registerUser(
                              name: _nameController.text,
                              phone: _phoneController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text,
                              petName: _petNameController.text,
                              petSpecies: _petSpeciesController.text,
                              petBreed: _petBreedController.text,
                              petAge: _petAgeController.text,
                              petGender: _petGenderController.text,
                              onSuccess: () {
                                // Si el registro fue exitoso
                                Navigator.pushNamed(context, '/home');
                              },
                              onError: (error) {
                                // Mostrar error si algo sale mal
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            child: const Center(
                              child: Text(
                                'Registrarse',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}