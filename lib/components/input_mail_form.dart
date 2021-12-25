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
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: greyInput,
        hintText: hintText,
        labelText: labelText,
        //prefixIcon: Icon(Icons.mail),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
