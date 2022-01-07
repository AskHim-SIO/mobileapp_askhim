import 'package:flutter/material.dart';

class buildCard extends StatelessWidget {
  final double borderRadius, width, height, sizeTitle, sizeSubtitle;
  final String linkImage, titleCard, subtitleCard;
  buildCard({
    Key? key,
    required this.borderRadius,
    required this.height,
    required this.width,
    required this.linkImage,
    required this.titleCard,
    required this.subtitleCard,
    required this.sizeTitle,
    required this.sizeSubtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Image.network(
                    linkImage,
                    fit: BoxFit.cover,
                  )),
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
    );
  }
}
