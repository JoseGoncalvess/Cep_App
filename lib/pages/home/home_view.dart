import 'package:cep_app/components/baner_initi_page.dart';
import 'package:cep_app/components/custom_butom_bar.dart';
import 'package:cep_app/components/form_apresentation_cep.dart';
import 'package:cep_app/pages/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/via_cep_service.dart';

class HomeView extends HomeViewModel{
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
        body: SingleChildScrollView(
            child: SizedBox(
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
                    Align(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Consumer<ViaCepService>(
                          builder: (context, service, child) =>  TextField(
                            onChanged: (value) {
                              if (value.length == 8) {
                                service.setcep(value);
                              }
                            },
                            onSubmitted: (value) {
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w700),
                            maxLength: 8,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.secondary,
                                border: const UnderlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.linearToEaseOut,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.5,
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
                        child: const FormApresentationCep()),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(12)),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
              )
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
              side: BorderSide.none, borderRadius: BorderRadius.circular(100)),
          onPressed: () => {
              pageViewController.jumpToPage(1),
          },
          child: const Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Consumer<ViaCepService>(
          builder: (context, value, child) =>  CustomButomBar(
            activeIndex: activeIndex,
            ontap: ({required index}) => setindextab(newindex: index),
          ),
        ));
  }
}
