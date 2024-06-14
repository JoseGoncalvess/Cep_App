import 'package:cep_app/my_app.dart';
import 'package:cep_app/service/cep_service.dart';
import 'package:flutter/material.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  CepService().initloadcepsid();
  runApp(const MyApp());
}
