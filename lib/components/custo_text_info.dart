import 'package:flutter/material.dart';

class CustoTextInfo extends StatelessWidget {
  const CustoTextInfo({super.key, required this.info, required this.campinfo});
  final String info;
  final String campinfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            "$campinfo: ",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * 0.034),
          ),
          Expanded(
            child: Text(
              info,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.width * 0.031),
            ),
          ),
        ],
      ),
    );
  }
}
