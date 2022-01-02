import 'package:ap4_askhim/components/form_verif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'constants.dart';

class MyWidget extends StatefulWidget {
  final String hintText, labelText;
  DateTime now = DateTime.now();
  final double borderRadius;

  MyWidget({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.borderRadius,
  }) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.hintText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      enableInteractiveSelection: false,
      onTap: () {
        // Below line stops keyboard from appearing
        FocusScope.of(context).requestFocus(new FocusNode());

        DatePicker.showDatePicker(context,
            showTitleActions: true,
            minTime: DateTime(1980, 1, 1),
            maxTime: DateTime(2014, 12, 31), onChanged: (date) {
          _controller.text = '$date';
        }, onConfirm: (date) {
          _controller.text = '$date';
        }, currentTime: DateTime.now(), locale: LocaleType.fr);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: greyInput,
        hintText: widget.hintText,
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
      ),
      validator: (v) {
        if (v!.isNotNull) {
          return null;
        } else {
          return 'Veuillez renseignez votre date de naissance';
        }
      },
    );
  }
}
