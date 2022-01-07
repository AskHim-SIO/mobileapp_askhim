import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.message,
    required this.press,
  }) : super(key: key);

  final Message message;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(message.image),
                ),
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 7),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      message.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )),
            Opacity(opacity: 0.64, child: Text(message.time)),
          ],
        ),
      ),
    );
  }
}
