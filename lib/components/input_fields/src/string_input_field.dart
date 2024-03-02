import 'package:flutter/material.dart';

class StringInputField extends StatelessWidget {
  final String? hintText;
  final int? maxLength;
  final bool autofocus;
  final TextEditingController? controller;

  const StringInputField({
    super.key,
    this.hintText,
    this.maxLength,
    this.autofocus = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(10),
          ))),
      maxLength: maxLength,
      autofocus: autofocus,
    );
  }
}
