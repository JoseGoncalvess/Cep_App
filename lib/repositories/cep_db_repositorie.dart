
import 'package:cep_app/models/endereco_model.dart';


abstract class CepDbRepositorie {
  
Future<List<Cepmodel>> getallceps ();

  
}