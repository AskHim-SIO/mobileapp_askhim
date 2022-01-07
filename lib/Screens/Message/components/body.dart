import 'package:ap4_askhim/Screens/Chat/chat_screen.dart';
import 'package:ap4_askhim/Screens/Message/message_screen.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'message_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatCard(
                message: chatsData[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
