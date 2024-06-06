// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cepmodel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String cidade;
  final String uf;
  final String ddd;
  Cepmodel({
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

  factory Cepmodel.fromMap(Map<String, dynamic> map) {
    return Cepmodel(
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      complemento: map['complemento'] as String,
      bairro: map['bairro'] as String,
      cidade: map['cidade'] as String,
      uf: map['uf'] as String,
      ddd: map['ddd'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cepmodel.fromJson(String source) => Cepmodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
