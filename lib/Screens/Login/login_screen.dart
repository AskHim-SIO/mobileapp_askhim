import 'package:flutter/material.dart';

import "package:ap4_askhim/Screens/Login/components/body.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
