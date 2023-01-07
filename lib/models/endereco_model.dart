import 'dart:convert';

class EnderecoModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String cidade;
  final String uf;
  final String ddd;

  EnderecoModel(
      {required this.cep,
      required this.logradouro,
      required this.complemento,
      required this.bairro,
      required this.cidade,
      required this.uf,
      required this.ddd});
  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': cidade,
      'uf': uf,
      'ddd': ddd
    };
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
        cep: map['cep'],
        logradouro: map['logradouro'],
        complemento: map['complemento'],
        bairro: map['bairro'],
        cidade: map['localidade'],
        uf: map['uf'],
        ddd: map['ddd']);
  }
  factory EnderecoModel.fromJson(String json) =>
      EnderecoModel.fromMap(jsonDecode(json));
}
