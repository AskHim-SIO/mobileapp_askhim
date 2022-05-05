import 'package:ap4_askhim/components/appbar.dart';
import 'package:flutter/material.dart';

import "package:ap4_askhim/Screens/Home/components/body.dart";

import 'components/bodyDesktop.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return const Body();
          } else {
            return const BodyDesktop();
          }
        },
      ),
    );
  }
}
