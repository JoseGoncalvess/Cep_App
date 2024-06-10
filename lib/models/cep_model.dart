// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'via_cep_model.dart';

class Cepmodel extends ViaCepModel {
  final String cepid;
   DateTime createdAt = DateTime.now();
   DateTime updatedAt =  DateTime.now();
  Cepmodel({
    required this.createdAt,
    required this.cepid,
    required this.updatedAt,
    required super.cep,
    required super.logradouro,
    required super.complemento,
    required super.bairro,
    required super.cidade,
    required super.uf,
    required super.ddd,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'cidade': cidade,
      'uf': uf,
      'ddd': ddd,
      'objectId': cepid,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }
    Map<String, dynamic> posttoMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'cidade': cidade,
      'uf': uf,
      'ddd': ddd,
    };
  }

  factory Cepmodel.adapter(ViaCepModel viacep,){
    return Cepmodel(cepid:'' , updatedAt: DateTime.now(),createdAt:DateTime.now(), cep: viacep.cep, logradouro: viacep.logradouro, complemento: viacep.complemento, bairro: viacep.bairro, cidade: viacep.cidade, uf: viacep.uf, ddd: viacep.ddd);
  }

  @override
  factory Cepmodel.fromMap(Map<String, dynamic> map) {
    return Cepmodel(
      cep: map['cep'] ?? "",
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      cidade: map['cidade'] ?? '',
      uf: map['uf'] ?? '',
      ddd: map['ddd'] ?? '',
      cepid: map['objectId'] ?? '',
      updatedAt: DateTime.parse(map['updatedAt']),
      createdAt: DateTime.parse(map['createdAt']),

    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory Cepmodel.fromJson(String source) =>
      Cepmodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
