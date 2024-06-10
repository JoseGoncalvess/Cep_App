
import 'package:cep_app/repositories/cep_repositorie/cep_repositorie_impl.dart';
import 'package:flutter/material.dart';

import '../models/via_cep_model.dart';

class ViaCepService extends ChangeNotifier {
    bool visible = false;
    bool isfavor = false;
    final CepRepositorieImpl cepRepositorie = CepRepositorieImpl();
    ViaCepModel _viacep = ViaCepModel.empyt();
    ViaCepModel get  viacep => _viacep;

    setvisible(){
      isfavor = !isfavor;
      notifyListeners();
    }

    set newcep(ViaCepModel cep)  {
      _viacep = cep;
      visible = !visible;
      notifyListeners();
    }

    Future setcep(String cep)async{
    newcep = await  cepRepositorie.getCep(cep);
    
    }

    cleancep(){
      newcep = ViaCepModel.empyt();
    }

    savecepdb()async{
      
    }
}