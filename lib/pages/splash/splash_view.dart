import 'package:flutter/material.dart';
import 'splash_view_model.dart';

class SplashView extends SplashViewModel{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.blue[800]),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/logo.png'),
            const Text(
              'Cep Certo',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
  
}