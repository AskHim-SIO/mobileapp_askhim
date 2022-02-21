import 'dart:async';
import 'package:ap4_askhim/Screens/Chat/chat_screen.dart';
import 'package:ap4_askhim/models/chat/getListMessageByUserToken.dart';
import 'package:ap4_askhim/services/chat_services.dart';
import 'package:flutter/material.dart';

import 'message_card.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<GetListMessageByUserToken?>?>? _listMessage;
  Timer? _everySecond;
  @override
  initState() {
    super.initState();
    _listMessage = ChatService.getListMessageByUserToken();

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 10), (Timer t) {
      if (this.mounted) {
        setState(() {
          _listMessage = ChatService.getListMessageByUserToken();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Container(
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: FutureBuilder<List<GetListMessageByUserToken?>?>(
                        future: _listMessage,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    var message = snapshot.data![index];
                                    return ChatCard(
                                      state: message!.service.state,
                                      photo: message.service.photos.isEmpty
                                          ? message.service.type.defaultPhoto
                                          : message.service.photos[0].libelle
                                              .toString(),
                                      nomService: message.service.name,
                                      nomUser: message.users[0].firstname +
                                          ' ' +
                                          message.users[0].name,
                                      press: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatScreen(
                                            state: message.service.state,
                                            idSender: message.users[1].id,
                                            idReceiver: message.users[0].id,
                                            photoProfil:
                                                message.users[0].profilPicture,
                                            nom: message.users[0].firstname,
                                            prenom: message.users[0].name,
                                            id: message.users[0].id,
                                            uuid: message.uuid,
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              return const Center(
                                  child: Text(
                                      'Vous n\'avez pas encore de message',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)));
                            }
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
