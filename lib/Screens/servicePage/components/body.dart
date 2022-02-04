// ignore_for_file: deprecated_member_use

import 'package:ap4_askhim/Screens/Message/message_screen.dart';
import 'package:ap4_askhim/Screens/Profile/profile_screen.dart';
import 'package:ap4_askhim/Screens/servicePage/components/ProductSlider.dart';
import 'package:ap4_askhim/Screens/servicePage/components/carousel.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/constants.dart';
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
    Size size = MediaQuery.of(context).size;
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
          ),
          SizedBox(height: size.width * 0.1),
          carousel(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),
              child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 15,
                    bottom: 15,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://i1.sndcdn.com/avatars-TxTlTnjuRCVM5loh-wkUE7A-t500x500.jpg"),
                      ),
                      const SizedBox(width: kDefaultPadding * 0.50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "ROMAIN MAHOT",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(
              name,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, right: 215),
            child: Text(
              "Description :",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ",
                  style: TextStyle(fontSize: 13, height: 1.0),
                ),
              ),
            ],
          ),
          SizedBox(
              height: 105,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 35, right: 35, top: 15, bottom: 15),
                child: RoundedButton(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageScreen(),
                      ),
                    );
                  },
                  sizeButton: 17,
                  text: 'Envoyer un Message',
                ),
              ))
        ],
      ),
    );
  }
}
