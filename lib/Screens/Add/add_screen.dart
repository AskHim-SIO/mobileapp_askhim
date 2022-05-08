import 'package:ap4_askhim/components/appbar.dart';
import 'package:flutter/material.dart';

import "package:ap4_askhim/Screens/Add/components/body.dart";

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
        return constraints.maxWidth < 600 ? const Scaffold(
          body:  Body(),
        ) : Scaffold(
          body:  Center(child: Container(width: MediaQuery.of(context).size.width * 0.8,child: Body())),
        );
      }
    );
  }
}
