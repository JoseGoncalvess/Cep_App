
import 'dart:convert';

import 'package:cep_app/models/via_cep_model.dart';
import 'package:flutter/material.dart';

import '../../repositories/local_data/local_data_favor_imp.dart';
import 'favo_cep.dart';

abstract class FavorCepViewModel extends State<FavoCep> {
  
  Future<void> savecep(ViaCepModel cep)async{
    List<String> cepsfavor=[];
    LocalDataFavorImp local =LocalDataFavorImp();
    cepsfavor.add(cep.toJson());

      // local.setfavorceps(key: "key", myfavorceps: cepsfavor);

  }

  Future<List<ViaCepModel>> loadfavorceps() async{
    List<String> cepsfavor=[];
    List<ViaCepModel> ceps=[];

    LocalDataFavorImp local =LocalDataFavorImp();
    cepsfavor = await local.getfavorceps(key: "key");
    for (var c in cepsfavor) {
          ceps.add(ViaCepModel.fromMap(jsonDecode(c)));
    }

      print(ceps.toList());
        return [];
   }

}