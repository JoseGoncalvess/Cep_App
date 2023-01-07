import 'package:cep_app/pages/Splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca CEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'RobotoSlab',
      ),
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
