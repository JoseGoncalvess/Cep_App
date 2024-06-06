// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'via_cep_model.dart';

class Cepmodel extends ViaCepModel {
  final String cepid;
  final DateTime createdAt = DateTime.now();
  final DateTime updatedAt;
  Cepmodel({
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
      'cepid': cepid,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
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
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory Cepmodel.fromJson(String source) =>
      Cepmodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
