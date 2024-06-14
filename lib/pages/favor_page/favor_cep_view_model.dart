import 'package:cep_app/service/cep_service.dart';
import 'package:flutter/material.dart';

import '../../models/cep_model.dart';
import 'favo_cep.dart';

abstract class FavorCepViewModel extends State<FavoCep> {
  List<Cepmodel> favors = [];
  @override
  void initState() {
    super.initState();
    CepService().loadcepdb().then((value) => setState(() {
          favors = value;
        }));
  }

  removeitem(int indexitem) {
    setState(() {
      favors.removeAt(indexitem);
    });
  }
}
