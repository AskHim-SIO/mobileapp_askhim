import 'package:ap4_askhim/components/form_verif.dart';
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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: greyInputBorder),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: greyInputBorder),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: greyInputBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: greyInputBorder),
          ),
          suffixIcon: IconButton(
            icon:
                isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            onPressed: togglePasswordVisibility,
          ),
        ),
        validator: (v) {
          if (v!.isNotEmpty) {
            return null;
          } else {
            return 'Veuillez renseignez un mot de passe valide';
          }
        },
        keyboardType: TextInputType.visiblePassword,
        autofillHints: [AutofillHints.password],
        onEditingComplete: () => TextInput.finishAutofillContext(),
      );

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
