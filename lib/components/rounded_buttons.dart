import 'package:ap4_askhim/constants.dart';

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function? press;
  final Color color, textColor;
  final double sizeButton;
  const RoundedButton({
    Key? key,
    required this.text,
    this.press,
    required this.sizeButton,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: size.width * sizeButton,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: () {
            press!();
          },
          child: Text(text,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
