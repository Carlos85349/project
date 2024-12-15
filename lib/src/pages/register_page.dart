import 'package:flutter/material.dart';
import 'package:myapp/src/widgets/custom_input.dart';
import 'package:provider/provider.dart';
import 'package:myapp/src/providers/login_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controladores para los campos de registro
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
    final TextEditingController petNameController = TextEditingController();
    final TextEditingController petSpeciesController = TextEditingController();
    final TextEditingController petBreedController = TextEditingController();
    final TextEditingController petAgeController = TextEditingController();
    final TextEditingController petGenderController = TextEditingController();

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
                                controller: nameController,
                              ),
                              CustomInput(
                                title: 'Número de teléfono',
                                icon: Icons.phone,
                                controller: phoneController,
                              ),
                              CustomInput(
                                title: 'Correo electrónico',
                                icon: Icons.email,
                                controller: emailController,
                              ),
                              CustomInput(
                                title: 'Contraseña',
                                icon: Icons.password,
                                obscureText: true,
                                controller: passwordController,
                              ),
                              CustomInput(
                                title: 'Confirmar Contraseña',
                                icon: Icons.password,
                                obscureText: true,
                                controller: confirmPasswordController,
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
                                controller: petNameController,
                              ),
                              CustomInput(
                                title: 'Especie',
                                icon: Icons.pets,
                                controller: petSpeciesController,
                              ),
                              CustomInput(
                                title: 'Raza',
                                icon: Icons.category,
                                controller: petBreedController,
                              ),
                              CustomInput(
                                title: 'Edad',
                                icon: Icons.calendar_today,
                                controller: petAgeController,
                              ),
                              CustomInput(
                                title: 'Sexo',
                                icon: Icons.transgender,
                                controller: petGenderController,
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
                              name: nameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                              petName: petNameController.text,
                              petSpecies: petSpeciesController.text,
                              petBreed: petBreedController.text,
                              petAge: petAgeController.text,
                              petGender: petGenderController.text,
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