import 'package:flutter/material.dart';

import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import "package:ap4_askhim/constants.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.black),
      home: WelcomeScreen(),
    );
  }
}
