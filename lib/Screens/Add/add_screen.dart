import 'package:ap4_askhim/components/appbar.dart';
import 'package:flutter/material.dart';

import "package:ap4_askhim/Screens/Add/components/body.dart";

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
