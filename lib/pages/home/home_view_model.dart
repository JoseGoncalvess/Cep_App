import 'package:cep_app/pages/home/home.dart';
import 'package:cep_app/service/via_cep_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../repositories/db/cep_db_repositorie_impl.dart';

abstract class HomeViewModel extends State<Home> {
  final CepDbRepositorieImpl dbrepositorie = CepDbRepositorieImpl();
  late PageController pageViewController;
  int activeIndex = 3;
  bool seachview = true;

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
      cepEC.clear();
      Provider.of<ViaCepService>(context, listen: false).cleancep();
    } else if (newindex == 0) {
      pageViewController.jumpToPage(2);
    }
  }

viewstateseach(bool value){
  seachview = value;
}

savecepdb(){
  
}

  
}
