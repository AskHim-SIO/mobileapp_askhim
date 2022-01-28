import 'package:ap4_askhim/Screens/servicePage/components/ProductSlider.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final String id, name, img, price;
  final List<String> mulImg;
  final List sizes;
  Body(
      {Key? key,
      required this.id,
      required this.sizes,
      required this.name,
      required this.img,
      required this.price,
      required this.mulImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                  )
                ]),
            child: Stack(
              children: <Widget>[ProductSlider(items: mulImg)],
            ),
          )
        ],
      ),
    );
  }
}
