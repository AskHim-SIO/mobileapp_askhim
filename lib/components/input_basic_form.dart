import 'package:ap4_askhim/components/form_verif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class InputBasicForm extends StatefulWidget {
  final String hintText, labelText;
  TextInputType? textInputType = TextInputType.text;

  Color? fillcolor;
  final double borderRadius;
  final TextEditingController controller;
  InputBasicForm(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.borderRadius,
      this.textInputType,
      this.fillcolor})
      : super(key: key);

  @override
  State<InputBasicForm> createState() => _InputBasicFormState();
}

class _InputBasicFormState extends State<InputBasicForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
      ],
      maxLines: 1,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillcolor,
        hintText: widget.hintText,
        labelText: widget.labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: greyInputBorder),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
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
