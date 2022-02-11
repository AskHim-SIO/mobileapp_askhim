// ignore_for_file: deprecated_member_use

import 'package:ap4_askhim/Screens/Message/message_screen.dart';
import 'package:ap4_askhim/Screens/Profile/profile_screen.dart';
import 'package:ap4_askhim/Screens/servicePage/components/carousel.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/serviceDetails.dart';
import 'package:ap4_askhim/services/serviceDetails.dart';
import 'package:ap4_askhim/Screens/servicePage/components/dynamic_card_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  final int id;
  Body({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Map<String, dynamic>?>? _service_details;
  initState() {
    _service_details = serviceDetails.getServiceDetails(widget.id.toString());
    super.initState();
  }

  String? value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          carousel(id: widget.id),
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
                  child: FutureBuilder<Map<String, dynamic>?>(
                      future: _service_details,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data!['user']['profilPicture']);
                          return Row(
                            children: [
                              snapshot.data!['user']['profilPicture'] == null
                                  ? CircleAvatar(
                                      radius: size.width * 0.2,
                                      backgroundColor: Colors.white,
                                      backgroundImage: const NetworkImage(
                                          'https://sbcf.fr/wp-content/uploads/2018/03/sbcf-default-avatar.png'),
                                    )
                                  : CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot
                                          .data!['user']['profilPicture'])),
                              SizedBox(width: kDefaultPadding * 0.50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!['user']['firstname'] +
                                        " " +
                                        snapshot.data!['user']['name'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
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
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
              ),
            ),
          ),
          FutureBuilder<Map<String, dynamic>?>(
            future: _service_details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    snapshot.data!['name'],
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder<Map<String, dynamic>?>(
            future: _service_details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.only(top: 15, left: 8),
                  child: Center(
                    child: Text(
                      " Créer le : " +
                          '${DateTime.fromMillisecondsSinceEpoch(snapshot.data!['dateStart'])}'
                              .substring(0, 9),
                      //"Créer le : " + snapshot.data!['dateStart'].toString(),
                      style: TextStyle(fontSize: 13, height: 1.0),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder<Map<String, dynamic>?>(
            future: _service_details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 18),
                  child: Center(
                    child: Text(
                      snapshot.data!['price'].toString() + " €",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, right: 215),
            child: Text(
              "Description :",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          FutureBuilder<Map<String, dynamic>?>(
            future: _service_details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        snapshot.data!['description'],
                        style: TextStyle(fontSize: 13, height: 1.0),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder<Map<String, dynamic>?>(
            future: _service_details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, top: 15, right: 8),
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
                    child: Row(
                      children: [
                        SizedBox(width: kDefaultPadding * 0.50),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DynamicCardService(
                                  id: snapshot.data!["type"]["id"],
                                  idS: snapshot.data!["id"]),
                              Text(
                                "",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
              ;
            },
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
            ),
          )
        ],
      ),
    );
  }
}
