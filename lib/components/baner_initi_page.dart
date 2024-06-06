import 'package:flutter/material.dart';

class BanerInitiPage extends StatelessWidget {

  const BanerInitiPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/location.png',
                  color: Theme.of(context).colorScheme.secondary,
                  scale: 4,
                ),
                Text("Encontre o Endereço que Procura!", style: TextStyle(color:Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05),)
              ],
            ),
          );
  }
}