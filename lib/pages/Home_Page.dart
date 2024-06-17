// ignore: file_names
import 'package:cep_app/repositories/cep_repositorie/cep_repositorie.dart';
import 'package:cep_app/repositories/cep_repositorie/cep_repositorie_impl.dart';
import 'package:flutter/material.dart';

import '../models/via_cep_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CepRepositorie cepRepositorie = CepRepositorieImpl();
  //A interrogação no final indica começar null
  ViaCepModel? enderecoModel;
  bool loading = false;
  bool infor = false;

  //Criei uma chave de validação do meu form
  final formKey = GlobalKey<FormState>();

  //controlador
  final cepEC = TextEditingController();
  @override
  //aqui garanto que ela vai ser descartada para não gera um bagagem na memoria
  void dispose() {
    cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(child: Text('Buscar CEP')),
        actions: [
          IconButton(
              onPressed: (() {
                setState(() {
                  enderecoModel = null;
                  infor = false;
                  loading = false;
                  cepEC.clear();
                });
              }),
              icon: const Icon(
                Icons.refresh,
                size: 20,
              ))
        ],
      ),
      drawer: Drawer(backgroundColor: Colors.blue[800]),
      body: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Insira abaixo o CEP',
                          style: TextStyle()
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "RobotoSlab-Medium",
                            ),
                            controller: cepEC,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "CEP Obrigatório";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final valid = formKey.currentState?.validate() ?? false;
                        //se foi valido agora vai la buscar os dados informados
                        if (valid) {
                          //traycatch e uma ação tomada par umas ituação, lado bome  lado ruim.
                          try {
                            setState(() {
                              loading = true;
                              infor = true;
                            });
                            final endereco =
                                await cepRepositorie.getCep(cepEC.text);
                            setState(() {
                              loading = false;
                              enderecoModel = endereco;
                            });
                          } catch (e) {
                            setState(() {
                              loading = false;
                              infor = false;
                              enderecoModel = null;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  backgroundColor: Colors.orange[700],
                                  content: const Text(
                                    'Erro ao Buscar Endereço',
                                  )),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[700]),
                      child: const Row(
                        children: [Icon(Icons.search_sharp), Text('Buscar')],
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: loading,
                  child: const CircularProgressIndicator(
                    backgroundColor: Colors.amber,
                  )),
              Container(
                height: MediaQuery.of(context).size.height * 0.80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: infor,
                      child: Image.asset(
                        'assets/img/location.png',
                        scale: 4,
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          const Text(
                            'Logradouro',
                            style:TextStyle(color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)
                          ),
                          Container(
                            width: 350,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            alignment: Alignment.center,
                            child: Visibility(
                                visible: infor,
                                child: Text(
                                  '${enderecoModel?.logradouro}',
                                  style: TextStyle(
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                'Complemento',
                                style: TextStyle(color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                child: Visibility(
                                    visible: infor,
                                    child: Text(
                                      '${enderecoModel?.complemento}',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                'Bairro',
                                style: TextStyle(color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                child: Visibility(
                                    visible: infor,
                                    child: Text(
                                      '${enderecoModel?.bairro}',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                'Complemento',
                                style: TextStyle(color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 270,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                child: Visibility(
                                    visible: infor,
                                    child: Text(
                                      '${enderecoModel?.cidade}',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                'Bairro',
                                style:
                                
                                 TextStyle(color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                child: Visibility(
                                    visible: infor,
                                    child: Text(
                                      '${enderecoModel?.uf}',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                'DDD',
                                style: TextStyle(color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                child: Visibility(
                                    visible: infor,
                                    child: Text(
                                      '${enderecoModel?.ddd}',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                'CEP',
                                style: TextStyle(color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 270,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                child: Visibility(
                                    visible: infor,
                                    child: Text(
                                      '${enderecoModel?.cep}',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
      )),
    );
  }
}
