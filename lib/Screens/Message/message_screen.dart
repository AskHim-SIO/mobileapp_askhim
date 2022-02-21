import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:ap4_askhim/components/appbar.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

import "package:ap4_askhim/Screens/Message/components/body.dart";
import 'package:flutter/services.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          title: const Center(
              child: Text("Messages",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold)))),
      body: Body(),
    );
  }
}
