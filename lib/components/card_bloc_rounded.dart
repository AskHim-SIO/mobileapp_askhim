import 'package:flutter/material.dart';

import '../constants.dart';

class buildCardRounded extends StatelessWidget {
  final double borderRadius, width, height, sizeTitle, sizeSubtitle;
  final String linkImage, titleCard, subtitleCard;
  final Icon icon;
  buildCardRounded({
    Key? key,
    required this.borderRadius,
    required this.height,
    required this.width,
    required this.linkImage,
    required this.titleCard,
    required this.subtitleCard,
    required this.sizeTitle,
    required this.sizeSubtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: width,
        height: height,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: greyInput,
                radius: 30,
                child: icon,
              ),
              const SizedBox(height: 2),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(titleCard,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: sizeTitle,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.centerLeft,
                child: Text(subtitleCard,
                    style: TextStyle(
                      fontSize: sizeSubtitle,
                      color: Colors.black,
                    )),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
