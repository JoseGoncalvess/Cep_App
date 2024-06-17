import 'package:cep_app/components/custo_text_info.dart';
import 'package:cep_app/pages/favor_page/favor_cep_view_model.dart';
import 'package:cep_app/service/cep_service.dart';
import 'package:flutter/material.dart';

class FavorCepView extends FavorCepViewModel {
  @override
  Widget build(BuildContext context) {
    return favors.isEmpty
        ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              isloading?CircularProgressIndicator(): Icon(Icons.warning_amber_rounded, color: Theme.of(context).primaryColor,size: MediaQuery.of(context).size.width * 0.3,),
                Text(
                 isloading?"Carregando ceps favoritos...": "Você não possui ceps favoritados ainda...",
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
          )
        : ListView.builder(
            itemCount: favors.length,
            itemBuilder: (context, index) => Dismissible(
              behavior: HitTestBehavior.translucent,
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                CepService().deletcep(cepid: favors[index].cepid);
                removeitem(index);
              },
              background: Container(
                  color: Theme.of(context).primaryColor,
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.delete, color: Colors.white),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('Remover de Favoritos',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  )),
              key: Key(favors[index].toString()),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              favors[index].uf,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        width: MediaQuery.of(context).size.width * 0.68,
                        height: MediaQuery.of(context).size.height * 0.17,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustoTextInfo(
                                  info: favors[index].logradouro,
                                  campinfo: "Logradouro"),
                              CustoTextInfo(
                                  info:
                                      " ${favors[index].bairro}, ${favors[index].cidade}.",
                                  campinfo: "Localidade"),
                              CustoTextInfo(
                                  info:
                                      "${favors[index].bairro}, ${favors[index].cidade}.",
                                  campinfo: "DDD da Região"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
