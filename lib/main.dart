import 'package:flutter/material.dart';
import 'package:myapp/src/configurations/configuration.dart';
import 'package:myapp/src/pages/home_page.dart';
import 'package:myapp/src/pages/login_page.dart';
import 'package:myapp/src/pages/register_page.dart';
import 'package:myapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart'; // Importamos provider
import 'package:myapp/src/providers/login_provider.dart'; // Importamos LoginProvider

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()), // Registramos el LoginProvider
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pets App',
        // Inicializamos una ruta
        initialRoute: '/login',
        // Creamos nuestras rutas
        routes: {
          '/': (context) => const HomePage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/confi': (context) => const ConfigurationPage(),
        },
        // Si tenemos un error a la hora de colocar una ruta nos llevará a LoginPage
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => LoginPage(),
          );
        },
      ),
    );
  }
}