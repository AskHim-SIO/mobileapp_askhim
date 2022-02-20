import 'package:ap4_askhim/models/ChatMessage.dart';
import 'package:ap4_askhim/models/chat/getDiscussionByUuid.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'text_message.dart';

class Message extends StatelessWidget {
  final int idReceiver, idSender;
  const Message({
    Key? key,
    required this.message,
    required this.idReceiver,
    required this.idSender,
  }) : super(key: key);

  final Map<String, dynamic>? message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(Map<String, dynamic>? message) {
      return TextMessage(
        message: message,
        idSender: idSender,
        idReceiver: idReceiver,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment: message!['author']['id'] == idSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (message!['author']['id'] == idSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(
                message!['author']['profilPicture'],
              ),
            ),
            const SizedBox(width: kDefaultPadding / 2),
          ],
          if (message!['author']['id'] == idReceiver) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(
                message!['author']['profilPicture'],
              ),
            ),
            const SizedBox(width: kDefaultPadding / 2),
          ],
          messageContaint(message),
        ],
      ),
    );
  }
}
