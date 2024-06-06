import 'dart:developer';
import 'package:cep_app/repositories/cep_repositorie.dart';
import 'package:dio/dio.dart';

import '../models/via_cep_model.dart';

class CepRepositorieImpl implements CepRepositorie {
  
  @override
  Future<ViaCepModel> getCep(String cep) async {
    try {
      final result = await Dio().get("https://viacep.com.br/ws/$cep/json/");
      return ViaCepModel.fromMap(result.data);
    } on DioError catch (e) {
      log('Erro ao buscar cep', error: e);
      throw Exception('erro ao buscar CEP');
    }
  }
}
