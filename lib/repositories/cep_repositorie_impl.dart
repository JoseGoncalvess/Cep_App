import 'dart:developer';

import 'package:cep_app/models/endereco_model.dart';
import 'package:cep_app/repositories/cep_repositorie.dart';
import 'package:dio/dio.dart';

class CepRepositorieImpl implements CepRepositorie {
  
  @override
  Future<Cepmodel> getCep(String cep) async {
    try {
      final result = await Dio().get("https://viacep.com.br/ws/$cep/json/");
      return Cepmodel.fromMap(result.data);
    } on DioError catch (e) {
      log('Erro ao buscar cep', error: e);
      throw Exception('erro ao buscar CEP');
    }
  }
}
