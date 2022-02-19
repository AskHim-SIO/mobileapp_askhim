import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Color(0xFF2B6CF2).withOpacity(0.08),
            ),
          ],
        ),
        child: SafeArea(
            child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(children: [
                  SizedBox(width: kDefaultPadding / 4),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Votre message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: kDefaultPadding / 4),
                  Icon(
                    Icons.send_rounded,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color!
                        .withOpacity(0.64),
                  ),
                ]),
              ),
            ),
          ],
        )));
  }
}
