import 'package:ap4_askhim/services/chat_services.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChatInputField extends StatefulWidget {
  final Function() refresh;
  final String uuid;
  const ChatInputField({Key? key, required this.uuid, required this.refresh})
      : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final chatController = TextEditingController();
  String? selectedTerm;
  @override
  void initState() {
    super.initState();
  }

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
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      onChanged: (query) {
                        setState(() {
                          selectedTerm = query;
                        });
                      },
                      controller: chatController,
                      onSubmitted: (query) {
                        ChatService.postChat(widget.uuid, query).then((value) {
                          if (value) {
                            chatController.clear();
                            widget.refresh();
                          }
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Votre message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: kDefaultPadding / 4),
                  GestureDetector(
                    onTap: () {
                      ChatService.postChat(widget.uuid, selectedTerm.toString())
                          .then((value) {
                        if (value) {
                          chatController.clear();
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          widget.refresh();
                        }
                      });
                    },
                    child: Icon(
                      Icons.send_rounded,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.color!
                          .withOpacity(0.64),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        )));
  }
}
