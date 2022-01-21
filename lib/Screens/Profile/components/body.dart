import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RoundedButton(
            text: 'Clear',
            sizeButton: 0.8,
            press: () {
              Hive.box('tokenBox').clear();
            }),
      ),
    );
  }
}
