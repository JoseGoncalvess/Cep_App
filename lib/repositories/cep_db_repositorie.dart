
import 'package:cep_app/models/cep_model.dart';


abstract class CepDbRepositorie {
  
Future<List<Cepmodel>> getallceps ();

  
}