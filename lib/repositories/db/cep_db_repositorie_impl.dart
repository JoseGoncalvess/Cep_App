import 'dart:developer';

import 'package:cep_app/models/custom_dio.dart';
import 'package:cep_app/models/cep_model.dart';
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
  Future<void> postcep({required Cepmodel cep}) async {
    log("message");
  }

  @override
  Future<void> deletcep({required String cepid}) async {
    log("message");
  }
}
