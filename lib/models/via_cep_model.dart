// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class ViaCepModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String cidade;
  final String uf;
  final String ddd;

  ViaCepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.cidade,
    required this.uf,
    required this.ddd,
  });

  Map<String, dynamic> toMap() {
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



  factory ViaCepModel.fromMap(Map<String, dynamic> map) {
    return ViaCepModel(
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      complemento: map['complemento'] as String,
      bairro: map['bairro'] as String,
      cidade: map['localidade'] as String,
      uf: map['uf'] as String,
      ddd: map['ddd'] as String,
    );
  }
  factory ViaCepModel.empyt() {
    return ViaCepModel(
        cep: '',
        logradouro: '',
        complemento: '',
        bairro: '',
        cidade: '',
        uf: '',
        ddd: '');
  }
  String toJson() => json.encode(toMap());

  factory ViaCepModel.fromJson(String source) =>
      ViaCepModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
