import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/via_cep_service.dart';

class FormApresentationCep extends StatefulWidget {

  const FormApresentationCep({super.key, required this.ontap,});
  final Function() ontap;

  @override
  State<FormApresentationCep> createState() => _FormApresentationCepState();
}

class _FormApresentationCepState extends State<FormApresentationCep> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ViaCepService>(
      builder: (_, service, child) =>  Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.width * 0.26),
                child: Text(
                  "Infomrações",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.07),
                ),
              ),
              IconButton(
                  onPressed: () {
                    service.isfavor==true?service.removecepfavor(service.viacep.cep): widget.ontap();
                  }
                  ,
                  icon: Icon(
                    color:(service.isfavor == true)? Colors.red : Colors.white,
                    (service.isfavor == true)? Icons.favorite_rounded:
                    Icons. favorite_border_rounded  ,
                    size: MediaQuery.of(context).size.width * 0.1,
                  ))
            ],
          ),
          SizedBox(
            child: Column(
              children: [
                Text('Logradouro',
                    style: Theme.of(context).textTheme.displayMedium),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: Visibility(
                      visible: service.visible,
                      child: Text(
                      service.viacep.logradouro,
                        style: Theme.of(context).textTheme.displaySmall,
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
                    Text(
                      'Cidade',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Visibility(
                          visible: service.visible,
                          child: Text(
                            service.viacep.cidade,
                            style: Theme.of(context).textTheme.displaySmall,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Text('Bairro',
                        style: Theme.of(context).textTheme.displayMedium),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Visibility(
                          visible:service.visible,
                          child: Text(
                            service.viacep.bairro,
                            style: Theme.of(context).textTheme.displaySmall,
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
                    Text('Referencia',
                        style: Theme.of(context).textTheme.displayMedium),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Visibility(
                          visible: service.visible,
                          child: Text(
                            service.viacep.complemento,
                            style: Theme.of(context).textTheme.displaySmall,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Text('UF', style: Theme.of(context).textTheme.displayMedium),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.13,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Visibility(
                          visible: service.visible,
                          child: Text(
                            service.viacep.uf,
                            style: Theme.of(context).textTheme.displaySmall,
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
                    Text('DDD', style: Theme.of(context).textTheme.displayMedium),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.13,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Visibility(
                          visible: service.visible,
                          child: Text(
                            service.viacep.ddd,
                            style: Theme.of(context).textTheme.displaySmall,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Text('CEP', style: Theme.of(context).textTheme.displayMedium),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Visibility(
                          visible: service.visible,
                          child: Text(
                            service.viacep.cep,
                            style: Theme.of(context).textTheme.displaySmall,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ), 
       
    );
  }
}
