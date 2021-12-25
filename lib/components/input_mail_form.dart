import 'package:ap4_askhim/components/form_verif.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class InputFormMail extends StatelessWidget {
  final String hintText, labelText;
  final double borderRadius;
  const InputFormMail({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: greyInput,
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      ),
      validator: (v) {
        if (v!.isValidEmail) {
          return null;
        } else {
          return 'Please enter a valid email';
        }
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}
