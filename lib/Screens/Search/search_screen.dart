import 'package:flutter/material.dart';

import "package:ap4_askhim/Screens/Search/components/body.dart";

import '../Search/components/bodyDesktop.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return Body();
          } else {
            return BodyDesktop();
          }
        },
      ),
    );
  }
}
