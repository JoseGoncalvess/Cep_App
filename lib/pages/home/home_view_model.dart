import 'package:cep_app/pages/home/home.dart';
import 'package:cep_app/repositories/cep_repositorie.dart';
import 'package:flutter/material.dart';
import '../../repositories/cep_repositorie_impl.dart';

abstract class HomeViewModel extends State<Home> {
  final CepRepositorie cepRepositorie = CepRepositorieImpl();
  late PageController pageViewController;
  int activeIndex = 3;
  bool loading = false;
  bool infor = false;
  final formKey = GlobalKey<FormState>();
  final cepEC = TextEditingController();

@override
  void initState() {
    super.initState();
    pageViewController = PageController();
  }

  @override
  //aqui garanto que ela vai ser descartada para não gera um bagagem na memoria
  void dispose() {
    super.dispose();
    cepEC.dispose();
  }


  setindextab({required int newindex}){
    setState(() {
      activeIndex = newindex;
    });
  }
}
