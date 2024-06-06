
import 'package:flutter/cupertino.dart';
import '../home/home.dart';

abstract class SplashViewModel extends State {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.of(context)
              .pushReplacement(CupertinoPageRoute(builder: (context) =>  const Home()))
        });
  }
}