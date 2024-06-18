import 'package:cep_app/service/cep_service.dart';
import 'package:flutter/material.dart';

import 'pages/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CepService().initloadcepsid();
  runApp(const MyApp());
}
