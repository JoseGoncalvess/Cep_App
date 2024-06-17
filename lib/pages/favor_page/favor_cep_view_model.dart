import 'package:cep_app/repositories/local_data/local_data_favor_imp.dart';
import 'package:cep_app/service/cep_service.dart';
import 'package:flutter/material.dart';

import '../../models/cep_model.dart';
import 'favo_cep.dart';

abstract class FavorCepViewModel extends State<FavoCep> {
  List<Cepmodel> favors = [];
  bool isloading = false;
  @override
  void initState() {
    super.initState();
   setState(() {
      isloading = true; 
   });
    CepService().loadcepdb().then((value) => initdata(list: value));
  }

  void initdata({required List<Cepmodel> list}){
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
      favors = list;
      isloading = false;
    }));
  }

  void removeitem(int indexitem) {
    _removekeylocal(favors[indexitem].cep);
    setState(() {
      favors.removeAt(indexitem);
    });
    
  }

  void _removekeylocal(String cep){
    LocalDataFavorImp().deletfavorcep(cep: cep, key: "@favor_cep");
    LocalDataFavorImp().deletforkeysdb(cep: cep, key: "@favor_cep_key");
  }
}
