import 'package:ap4_askhim/services/chat_services.dart';
import 'package:ap4_askhim/services/profile_service.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChatInputField extends StatefulWidget {
  final Function() refresh;
  final String uuid;
  final int id;
  final bool state;
  const ChatInputField(
      {Key? key,
      required this.state,
      required this.id,
      required this.uuid,
      required this.refresh})
      : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final chatController = TextEditingController();
  String? selectedTerm;
  bool boolContainer = false;
  @override
  void initState() {
    super.initState();
    ProfileService.getUserInfo().then((valU) {
      valU!['id'] == widget.id ? boolContainer = true : boolContainer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.50,
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
            child: Row(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 0.65,
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
          widget.state
              ? boolContainer
                  ? InkWell(
                      onLongPress: () {
                        ChatService.getDiscussionByUuid(widget.uuid)
                            .then((val1) {
                          ChatService.validateService(
                                  val1!['service']['id'], widget.id)
                              .then((val2) {
                            if (val2) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(Duration(seconds: 3), () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return const AlertDialog(
                                      title: Text(
                                          'Votre service à bien été cloturé'),
                                    );
                                  });
                            } else {
                              print(val2);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(Duration(seconds: 3), () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return const AlertDialog(
                                      title: Text(
                                          'Votre service n\'a pas été cloturé'),
                                    );
                                  });
                            }
                          });
                        });
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 3), () {
                                  Navigator.of(context).pop(true);
                                });
                                return AlertDialog(
                                  title: Text(
                                      'Appuyez longtemps sur le bouton pour finaliser la demande de service'),
                                );
                              });
                        },
                        child: Icon(Icons.send, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(40, 15),
                          shape: CircleBorder(),
                          padding: EdgeInsets.only(left: 2),
                          primary: Colors.red, // <-- Button color
                          onPrimary: Colors.redAccent, // <-- Splash color
                        ),
                      ),
                    )
                  : Container()
              : Container()
        ])));
  }
}
