import 'package:cep_app/models/cep_model.dart';
import '../models/via_cep_model.dart';
import '../repositories/db/cep_db_repositorie_impl.dart';

class CepService extends CepDbRepositorieImpl {
  

  savecepdb(ViaCepModel cep) async {
    postcep(cep: cep);
  }

  Future<List<Cepmodel>> loadcepdb() async {
    List<Cepmodel> cepfavor = [];

    cepfavor = await getallceps();

    return cepfavor;
  }

  removecep(String cep)async{
    deletcep(cepid: cep);
  }
}
