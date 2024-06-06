import 'dart:developer';
import 'package:cep_app/models/custom_dio.dart';
import 'package:cep_app/models/endereco_model.dart';
import 'package:dio/dio.dart';

class CepDbRepositorie {
  final _customDio = CustomDio4App();

  Future<List<Cepmodel>> getallceps() async {
    List<Cepmodel> ceps = [];

    try {
      _customDio.dio.get("/Favor_Ceps").then((json) => {
            if (json.statusCode == 200) {ceps.add(Cepmodel.fromMap(json.data))}
          });
    } on DioError catch (e) {
      log("O erro foi $e!");
    }

    return ceps;
  }
}
