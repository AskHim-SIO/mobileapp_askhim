import 'package:ap4_askhim/components/appbar.dart';
import 'package:flutter/material.dart';

import "package:ap4_askhim/Screens/Home/components/body.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
