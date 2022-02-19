import 'package:ap4_askhim/components/form_verif.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class InputAdress extends StatefulWidget {
  final String hintText, labelText;
  TextInputType? textInputType = TextInputType.streetAddress;
  final Function(String)? onChanged;
  String finalAdresse;

  Color? fillcolor;
  final double borderRadius;
  final TextEditingController controller;
  InputAdress(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.borderRadius,
      required this.finalAdresse,
      this.onChanged,
      this.textInputType,
      this.fillcolor})
      : super(key: key);

  @override
  State<InputAdress> createState() => _InputAdressState();
}

class _InputAdressState extends State<InputAdress> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
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
        if (widget.finalAdresse.isNotEmpty) {
          return null;
        } else {
          return 'Veuillez entrer des informations valides';
        }
      },
    );
  }
}
