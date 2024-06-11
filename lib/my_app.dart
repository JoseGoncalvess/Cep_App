import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/splash/splash.dart';
import 'service/via_cep_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<ViaCepService>(create: (context) => ViaCepService()),],
      child: MaterialApp(
        title: 'Busca CEP',
        theme: ThemeData(
            textTheme: TextTheme(
               displayMedium : TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold),
                displaySmall: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.blue[900], fontWeight: FontWeight.bold)),
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                primary: const Color(0xFFFACB3E),
                secondary: const Color(0xFF1565C0)),
            useMaterial3: true),
        home: const Splash(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
