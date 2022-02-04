import 'package:ap4_askhim/components/form_verif.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class InputBasicForm extends StatelessWidget {
  final String hintText, labelText;

  Color? fillcolor;
  final double borderRadius;
  final TextEditingController controller;
  InputBasicForm(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.borderRadius,
      this.fillcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillcolor,
        hintText: hintText,
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: greyInputBorder),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: greyInputBorder),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: greyInputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: greyInputBorder),
        ),
      ),
      validator: (v) {
        if (v!.isNotEmpty) {
          return null;
        } else {
          return 'Veuillez entrer des informations valides';
        }
      },
    );
  }
}
