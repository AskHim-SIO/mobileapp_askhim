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
  final int idReceiver, idSender, id;
  final bool state;
  Body(
      {Key? key,
      required this.state,
      required this.id,
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
  ScrollController? _scrollController;

  @override
  void initState() {
    _listMessage = ChatService.getDiscussionByUuid(widget.uuid);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController = ScrollController();
    });

    super.initState();
    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 2), (Timer t) {
      if (this.mounted) {
        setState(() {
          _listMessage = ChatService.getDiscussionByUuid(widget.uuid);
        });
        scrollToBottom();
      }
    });
  }

  void scrollToBottom() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_scrollController!.hasClients) {
        final bottomOffset = _scrollController!.position.maxScrollExtent;
        _scrollController!.jumpTo(_scrollController!.position.maxScrollExtent);
      }
    });
  }

  void refresh() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _scrollController = ScrollController();
      });
    });
    scrollToBottom();
    print(('refresh'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        controller: _scrollController,
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
        SizedBox(height: size.width * 0.02),
        ChatInputField(
          state: widget.state,
          id: widget.id,
          uuid: widget.uuid,
          refresh: refresh,
        ),
      ],
    );
  }
}
