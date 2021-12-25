import 'package:flutter/material.dart';

import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import "package:ap4_askhim/constants.dart";
import 'package:flutter/services.dart';

void main() {
  // avoid rotation screen
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Inter'),
      home: WelcomeScreen(),
    );
  }
}
