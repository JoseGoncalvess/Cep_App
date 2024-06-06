import 'package:cep_app/models/endereco_model.dart';

abstract class CepRepositorie {
  Future<Cepmodel> getCep(String cep);
}
