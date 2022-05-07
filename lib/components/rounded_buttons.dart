import 'package:ap4_askhim/constants.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


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
    Size size = MediaQuery
        .of(context)
        .size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: constraints.maxWidth < 600 ? size.width * sizeButton : 40.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: color,
              onPressed: () {
                press!();
              },
              child: Text(text,
                  style: TextStyle(
                      color: textColor, fontWeight: FontWeight.bold)),
            ),
          ),
        );
      },
    );
  }
}