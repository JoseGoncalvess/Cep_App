import 'package:flutter/material.dart';

import 'pages/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca CEP',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, primary: const Color(0xFFFACB3E), secondary:const Color(0xFF1565C0) ),
          useMaterial3: true),
      home: const Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}



