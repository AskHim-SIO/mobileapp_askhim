import 'package:ap4_askhim/components/form_verif.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class BigInput extends StatelessWidget {
  final String hintText, labelText;
  TextInputType? textInputType = TextInputType.text;

  Color? fillcolor;
  final double borderRadius;
  final TextEditingController controller;
  BigInput(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.borderRadius,
      this.textInputType,
      this.fillcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 20,
      maxLength: 1000,
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
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.red),
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
