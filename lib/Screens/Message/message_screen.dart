import 'package:ap4_askhim/components/appbar.dart';
import 'package:flutter/material.dart';

import "package:ap4_askhim/Screens/Message/components/body.dart";

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
