import 'dart:convert';

import 'package:cep_app/models/cep_model.dart';
import '../models/via_cep_model.dart';
import '../repositories/db/cep_db_repositorie_impl.dart';
import '../repositories/local_data/local_data_favor_imp.dart';

class CepService extends CepDbRepositorieImpl {
  savecepdb(ViaCepModel cep) async {
    postcep(cep: cep);
  }

  Future<List<Cepmodel>> loadcepdb() async {
    List<Cepmodel> cepfavor = [];
    cepfavor = await getallceps();
    return cepfavor;
  }

  removecep(String cepid) async {
    deletcep(cepid: cepid);
  }

  initloadcepsid() async {
    List<Cepmodel> cepfavor = [];
    List<String> favor = [];
    Map<String, dynamic> myfavorceps = {};

       Map<String, dynamic> map = await LocalDataFavorImp().getforkeysdb(key: "@favor_cep_key");
        if (map.isEmpty) {
      cepfavor = await getallceps();

      if (cepfavor.isNotEmpty) {
        for (var ceps in cepfavor) {
          myfavorceps[ceps.cep] = ceps.cepid;
          favor.add(ceps.cep);
        }
          _savekeyslocal(mapkey: myfavorceps, favor: favor);
      } 

        }
  }

  _savekeyslocal({required Map<String, dynamic> mapkey, required List<String> favor}){
          LocalDataFavorImp().setforkeysdb(
          key: "@favor_cep_key", myfavorceps: jsonEncode(mapkey));
      LocalDataFavorImp().setfavorceps(key: "@favor_cep", myfavorceps: favor);
  }

  Map<String, dynamic> _loadcepid() {
    Map<String, dynamic> keys = LocalDataFavorImp().getforkeysdb(
      key: "@favor_cep_key",
    ) as Map<String, dynamic>;
    return keys;
  }
  deletkeylocal({required String cep}){
      
  }
}
