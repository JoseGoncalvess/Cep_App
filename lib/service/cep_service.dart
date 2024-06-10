
import 'dart:developer';

import 'package:cep_app/models/cep_model.dart';

import '../repositories/db/cep_db_repositorie_impl.dart';

class CepService {
  
  CepDbRepositorieImpl cepimpl = CepDbRepositorieImpl();

  savecepdb(Cepmodel cep)async{
    log(cep.toJson());
    cepimpl.postcep(cep: cep);
  }
   Future loadcepdb()async{
    log(cepimpl.getallceps().toString());
    
  }
}