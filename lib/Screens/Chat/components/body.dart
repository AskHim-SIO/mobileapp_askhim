import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

import 'chat_input_filed.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Text("yo tout le monde !"),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
