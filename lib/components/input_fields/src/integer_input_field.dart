import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntegerInputField extends StatelessWidget {
  final String? hintText;
  final bool autofocus;
  final TextEditingController? controller;

  const IntegerInputField({
    super.key,
    this.hintText,
    this.autofocus = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(10),
          ))),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ], //
      autofocus: autofocus,
    );
  }
}
