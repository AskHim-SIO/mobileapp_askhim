import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';

class InputFormPassword extends StatefulWidget {
  final TextEditingController controller;
  final double borderRadius;
  final String hintText, labelText;

  const InputFormPassword({
    Key? key,
    required this.controller,
    required this.borderRadius,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  _InputFormPasswordState createState() => _InputFormPasswordState();
}

class _InputFormPasswordState extends State<InputFormPassword> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        obscureText: isHidden,
        decoration: InputDecoration(
          fillColor: greyInput,
          filled: true,
          hintText: widget.hintText,
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          suffixIcon: IconButton(
            icon:
                isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            onPressed: togglePasswordVisibility,
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        autofillHints: [AutofillHints.password],
        onEditingComplete: () => TextInput.finishAutofillContext(),
        validator: (password) => password != null && password.length < 5
            ? 'Enter min. 5 characters'
            : null,
      );

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
