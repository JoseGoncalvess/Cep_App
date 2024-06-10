import 'package:cep_app/pages/favor_page/favor_cep_view_model.dart';
import 'package:flutter/material.dart';


class FavorCepView extends FavorCepViewModel {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.brown, borderRadius: BorderRadius.circular(12)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
      ),
    );
  }
}
