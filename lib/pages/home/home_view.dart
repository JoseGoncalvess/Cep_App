import 'package:cep_app/components/baner_initi_page.dart';
import 'package:cep_app/components/custom_butom_bar.dart';
import 'package:cep_app/pages/home/home_view_model.dart';
import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
            child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: PageView(
            controller: pageViewController,
            children: [
              const BanerInitiPage(),
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
          onPressed: () => {},
          child: const Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomButomBar(
          activeIndex: activeIndex,
          ontap: ({required index}) => setindextab(newindex: index),
        ));
  }
}
