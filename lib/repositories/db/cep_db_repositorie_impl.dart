import 'dart:developer';

import 'package:cep_app/models/custom_dio.dart';
import 'package:cep_app/models/cep_model.dart';
import 'package:cep_app/models/via_cep_model.dart';
import 'package:dio/dio.dart';

import 'cep_db_repositorie.dart';

class CepDbRepositorieImpl extends CepDbRepositorie {
  final _customDio = CustomDio4App();

  @override
  Future<List<Cepmodel>> getallceps() async {
    List<Cepmodel> ceps = [];

    Response result = await _customDio.dio.get("/Favor_Ceps");
    if (result.statusCode == 200) {
      for (var cep in result.data['results']) {
        ceps.add(Cepmodel.fromMap(cep));
      }
    }

    return ceps;
  }

  @override
  Future<void> postcep({required ViaCepModel cep}) async {
    log(cep.toJson());

  try {
    await _customDio.dio.post("/Favor_Ceps"  ,data: cep.toMap());
  } catch (e) {
    log(e.toString());
  }

  }

  @override
  Future<void> deletcep({required String cepid}) async {
    log("message");
  }
}
