

import '../models/via_cep_model.dart';

abstract class CepRepositorie {
  Future<ViaCepModel> getCep(String cep);
}
