import 'dart:developer';

import 'package:cep_app/repositories/cep_repositorie/cep_repositorie_impl.dart';
import 'package:flutter/material.dart';

import '../models/via_cep_model.dart';
import '../repositories/local_data/local_data_favor_imp.dart';

class ViaCepService extends ChangeNotifier {
  bool visible = false;
  bool isfavor = false;
  final CepRepositorieImpl cepRepositorie = CepRepositorieImpl();
  LocalDataFavorImp local_favor = LocalDataFavorImp();
  ViaCepModel _viacep = ViaCepModel.empyt();
  ViaCepModel get viacep => _viacep;

  setvisible(bool value) {
    isfavor = value;
    notifyListeners();
  }

  set newcep(ViaCepModel cep) {
    _viacep = cep;
    if (!visible) {
      visible = true;
    }
    notifyListeners();
  }

  Future getcep(String cep) async {
    newcep = await cepRepositorie.getCep(cep);
    _validadefavor(cep);
  }

  cleancep() {
    newcep = ViaCepModel.empyt();
  }

  saveceplocal(String cep) async {
    List<String> favor = await local_favor.getfavorceps(key: "@favor_cep");
    favor.add(cep);
    local_favor.setfavorceps(key: "@favor_cep", myfavorceps: favor);
  }

  _validadefavor(String cep) async {
    List<String> favor = await local_favor.getfavorceps(key: "@favor_cep");
    await cepRepositorie
        .getCep(cep)
        .then((value) => {
        setvisible(favor.contains(value.cep)),
        log(isfavor.toString())});
  }

  removecepfavor(String cep){
    
  }
}
