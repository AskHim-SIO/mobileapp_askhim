import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import 'chat_input_filed.dart';
import 'message.dart';
import 'text_message.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: demeChatMessages[index]),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
