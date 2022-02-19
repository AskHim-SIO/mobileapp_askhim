import 'package:ap4_askhim/models/ChatMessage.dart';
import 'package:ap4_askhim/models/chat/getDiscussionByUuid.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextMessage extends StatelessWidget {
  final int idReceiver, idSender;

  const TextMessage({
    Key? key,
    required this.message,
    required this.idReceiver,
    required this.idSender,
  }) : super(key: key);
  final Map<String, dynamic>? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor
            .withOpacity(message!['author']['id'] == idReceiver ? 1 : 0.08),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        message!['message'],
        style: TextStyle(
          color: message!['author']['id'] == idSender
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1?.color,
        ),
      ),
    );
  }
}
