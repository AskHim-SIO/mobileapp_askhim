import 'package:ap4_askhim/Screens/ModifProfile/components/input_basic_form.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String libelle, inputHint;
  TextInputType? textInputType = TextInputType.text;

  Input(
      {Key? key,
      required this.controller,
      required this.libelle,
      required this.inputHint,
      this.textInputType})
      : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.libelle,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              //height: size.width * 0.12,
              width: size.width * 0.5,
              child: InputBasicForm(
                fillcolor: Colors.white,
                labelText: widget.inputHint,
                borderRadius: 15,
                controller: widget.controller,
                hintText: '',
                textInputType: widget.textInputType,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
