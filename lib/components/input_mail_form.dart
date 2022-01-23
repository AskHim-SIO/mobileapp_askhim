import 'package:ap4_askhim/components/form_verif.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class InputFormMail extends StatelessWidget {
  final TextEditingController controller;

  final String hintText, labelText;
  final double borderRadius;

  const InputFormMail({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: greyInput,
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
        if (v!.isValidEmail) {
          return null;
        } else {
          return 'Veuillez entrer un email valide';
        }
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}
