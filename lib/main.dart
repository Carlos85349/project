import 'package:flutter/material.dart';
import 'package:myapp/src/pages/fragments/register_page.dart';
import 'package:myapp/src/pages/home_page.dart';
import 'package:myapp/src/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pets App',
      home: RegisterPage(),
    );
  }
}
