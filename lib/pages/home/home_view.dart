import 'package:cep_app/components/baner_initi_page.dart';
import 'package:cep_app/components/custom_butom_bar.dart';
import 'package:cep_app/components/custom_seach_cep.dart';
import 'package:cep_app/components/form_apresentation_cep.dart';
import 'package:cep_app/models/cep_model.dart';
import 'package:cep_app/pages/home/home_view_model.dart';
import 'package:cep_app/service/cep_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../service/via_cep_service.dart';
import '../favor_page/favo_cep.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: const Center(
              child: Text(
            'Buscar CEP',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: PageView(
            controller: pageViewController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const BanerInitiPage(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Qual CEP deseja Encontrar ?",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                      CustomSeachCep(
                          ontap: (focus) => viewstateseach(focus),
                          twotap: (submit) => viewstateseach(submit)),
                      Consumer<ViaCepService>(
                        builder: (context, value, child) => AnimatedOpacity(
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.decelerate,
                          opacity: value.visible ? 1 : 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width *
                                (value.visible ? 0.9 : 0),
                            height: MediaQuery.of(context).size.height *
                                (value.visible ? 0.5 : 0),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      offset: Offset(-1, 1),
                                      spreadRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor),
                            child: FormApresentationCep(
                              isfavor: value.isfavor,
                              ontap: () {
                                (value.isfavor==true)?(){}:
                                {CepService()
                                    .savecepdb(value.viacep),
                                value.setvisible(true),
                                value.saveceplocal(value.viacep.cep)};
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const FavoCep()
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: seachview,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(100)),
            onPressed: () => {
              pageViewController.jumpToPage(1),
            },
            child: const Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Consumer<ViaCepService>(
          builder: (context, value, child) => CustomButomBar(
            activeIndex: activeIndex,
            ontap: ({required index}) => setindextab(newindex: index),
          ),
        ));
  }
}
