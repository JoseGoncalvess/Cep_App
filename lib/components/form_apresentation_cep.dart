import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormApresentationCep extends StatefulWidget {
  final bool visible;

  const FormApresentationCep({super.key, required this.visible});

  @override
  State<FormApresentationCep> createState() => _FormApresentationCepState();
}

class _FormApresentationCepState extends State<FormApresentationCep> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
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
                    visible: widget.visible,
                    child: Text(
                      '',
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
                        visible: true,
                        child: Text(
                          'cocorou',
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
                        visible: widget.visible,
                        child: Text(
                          '',
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
                        visible: widget.visible,
                        child: Text(
                          '',
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
                        visible: widget.visible,
                        child: Text(
                          '',
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
                        visible: widget.visible,
                        child: Text(
                          '',
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
                        visible: widget.visible,
                        child: Text(
                          '',
                          style: Theme.of(context).textTheme.displaySmall,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
