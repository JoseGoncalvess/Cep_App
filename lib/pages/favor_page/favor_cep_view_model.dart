import 'package:cep_app/repositories/local_data/local_data_favor_imp.dart';
import 'package:cep_app/service/cep_service.dart';
import 'package:flutter/material.dart';

import '../../models/cep_model.dart';
import 'favo_cep.dart';

abstract class FavorCepViewModel extends State<FavoCep> {
  List<Cepmodel> favors = [];
  @override
  void initState() {
    super.initState();
    CepService().loadcepdb().then((value) => setState(() {
          favors = value;
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
