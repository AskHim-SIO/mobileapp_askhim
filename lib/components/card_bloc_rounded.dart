import 'package:flutter/material.dart';

import '../constants.dart';

class buildCardRounded extends StatelessWidget {
  final double borderRadius, width, height, sizeTitle, sizeSubtitle;
  final String linkImage, titleCard;
  final Icon icon;
  const buildCardRounded({
    Key? key,
    required this.borderRadius,
    required this.height,
    required this.width,
    required this.linkImage,
    required this.titleCard,
    required this.sizeTitle,
    required this.sizeSubtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          SizedBox(height: size.width * 0.07),
          CircleAvatar(
            backgroundColor: greyInput,
            radius: 30,
            child: icon,
          ),
          SizedBox(height: size.width * 0.04),
          Expanded(
            child: Text(titleCard,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: sizeTitle,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}
