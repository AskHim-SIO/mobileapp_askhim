import 'package:ap4_askhim/Screens/Chat/components/body.dart';
import 'package:ap4_askhim/Screens/Profile/profile_screen.dart';
import 'package:ap4_askhim/Screens/servicePage/PublicProfile/publicprofile.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/chat/getDiscussionByUuid.dart';
import 'package:ap4_askhim/services/chat_services.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  String photoProfil, nom, prenom;
  String uuid;
  int idReceiver, idSender, id;
  final bool state;
  ChatScreen(
      {Key? key,
      required this.uuid,
      required this.state,
      required this.id,
      required this.photoProfil,
      required this.nom,
      required this.prenom,
      required this.idReceiver,
      required this.idSender})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(
          state: widget.state,
          id: widget.id,
          uuid: widget.uuid,
          idReceiver: widget.idReceiver,
          idSender: widget.idSender),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: kPrimaryColor,
              ), // Put icon of your preference.
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.photoProfil),
            ),
            SizedBox(width: kDefaultPadding * 0.50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.prenom + ' ' + widget.nom,
                  style: const TextStyle(
                      fontSize: 16,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => PublicProfile(id: widget.idReceiver)),
              );
            },
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
