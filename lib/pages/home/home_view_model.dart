import 'package:cep_app/pages/home/home.dart';
import 'package:cep_app/repositories/cep_repositorie.dart';
import 'package:flutter/material.dart';
import '../../repositories/cep_db_repositorie_impl.dart';
import '../../repositories/cep_repositorie_impl.dart';
import 'dart:developer';

abstract class HomeViewModel extends State<Home> {
  final CepRepositorie cepRepositorie = CepRepositorieImpl();
  final CepDbRepositorieImpl dbrepositorie = CepDbRepositorieImpl();

  

  late PageController pageViewController;
  int activeIndex = 3;
  bool loading = false;
  bool infor = false;
  final formKey = GlobalKey<FormState>();
  final cepEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    pageViewController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    cepEC.dispose();
  }

  setindextab({required int newindex}) {
    setState(() {
      activeIndex = newindex;
    });
    if (newindex == 1) {
       pageViewController.jumpToPage(0);
    }else if (newindex == 0){
       pageViewController.jumpToPage(2);
    }

    
  }

  getfavorCep() {
    dbrepositorie.getallceps().then((value) => log(value.toList().toString()));
  }

  getcep(String cep){
    print(cepRepositorie.getCep('56503580'));
  }
}
