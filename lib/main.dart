import 'package:flutter/material.dart';
import 'package:myapp/src/configurations/configuration.dart';
import 'package:myapp/src/pages/home_page.dart';
import 'package:myapp/src/pages/login_page.dart';
import 'package:myapp/src/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pets App',
      //inicializamos una ruta
      initialRoute: '/login',
      //creamos nuestras rutas
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/confi': (context) => const ConfigurationPage(),
      },
      //si tenemos un error a la hora de colocar una ruta nos llevara a Home page
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      },
    );
  }
}
