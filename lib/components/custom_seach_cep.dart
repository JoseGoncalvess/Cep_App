import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/via_cep_service.dart';

class CustomSeachCep extends StatefulWidget {
  const CustomSeachCep({super.key, required this.ontap, required this.twotap});
  final Function(bool value) ontap;
  final Function(bool value) twotap;

  @override
  State<CustomSeachCep> createState() => _CustomSeachCepState();
}

class _CustomSeachCepState extends State<CustomSeachCep> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Consumer<ViaCepService>(
        builder: (context, service, child) => TextField(
          onChanged: (value) {
            if (value.length == 8) {
              service.getcep(value);
            }
          },
          onTap: () => widget.ontap(false),
          onSubmitted: (value) {
            widget.twotap(true);
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLines: 1,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          maxLength: 8,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              border: const UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
