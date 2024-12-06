import 'package:flutter/material.dart';
import 'package:myapp/src/widgets/custom_input.dart';
import 'package:myapp/src/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                            child: const Column(
                              children: <Widget>[
                                SizedBox(height: 25,child: Text("Datos personales:"),),
                                CustomInput(
                                  title: 'Nombre Completo ',
                                  icon: Icons.person,
                                ),
                                CustomInput(
                                  title: 'Numero de telefono',
                                  icon: Icons.phone,
                                ),
                                CustomInput(
                                  title: 'Correo electronico',
                                  icon: Icons.email,
                                ),
                                CustomInput(
                                  title: 'Contraseña',
                                  icon: Icons.password,
                                ),
                                CustomInput(
                                  title: 'Confirmar Contraseña',
                                  icon: Icons.password,
                                ),
                                SizedBox(height: 20,),
                                SizedBox(height: 25,child: Text("Datos de tu mascota:"),),
                                CustomInput(
                                  title: 'Nombre',
                                  icon: Icons.person,
                                ),
                                CustomInput(
                                  title: 'Especie',
                                  icon: Icons.pets,
                                ),
                                CustomInput(
                                  title: 'Raza',
                                  icon: Icons.category,
                                ),
                                CustomInput(
                                  title: 'Edad',
                                  icon: Icons.calendar_today,
                                ),
                                CustomInput(
                                  title: 'Sexo',
                                  icon: Icons.transgender,
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
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