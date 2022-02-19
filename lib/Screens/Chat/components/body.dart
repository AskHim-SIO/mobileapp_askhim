import 'dart:async';

import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/ChatMessage.dart';
import 'package:ap4_askhim/models/chat/getDiscussionByUuid.dart';
import 'package:ap4_askhim/services/chat_services.dart';
import 'package:flutter/material.dart';

import 'chat_input_filed.dart';
import 'message.dart' as M;
import 'text_message.dart';

class Body extends StatefulWidget {
  final String uuid;
  final int idReceiver, idSender;
  Body(
      {Key? key,
      required this.uuid,
      required this.idReceiver,
      required this.idSender})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Map<String, dynamic>?>? _listMessage;
  Timer? _everySecond;

  @override
  void initState() {
    _listMessage = ChatService.getDiscussionByUuid(widget.uuid);

    super.initState();
    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 10), (Timer t) {
      if (this.mounted) {
        setState(() {
          _listMessage = ChatService.getDiscussionByUuid(widget.uuid);
        });
      }
    });
  }

  void redirect() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: FutureBuilder<Map<String, dynamic>?>(
                future: _listMessage,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var message = snapshot.data;
                    return ListView.builder(
                        itemCount: snapshot.data!['messages'].length,
                        itemBuilder: (context, index) {
                          return M.Message(
                              message: snapshot.data!['messages'][index],
                              idSender: widget.idSender,
                              idReceiver: widget.idReceiver);
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
