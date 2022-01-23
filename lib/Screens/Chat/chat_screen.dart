import 'package:ap4_askhim/Screens/Chat/components/body.dart';
import 'package:ap4_askhim/components/appbar.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
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
              backgroundImage: NetworkImage(
                  "https://i1.sndcdn.com/avatars-TxTlTnjuRCVM5loh-wkUE7A-t500x500.jpg"),
            ),
            SizedBox(width: kDefaultPadding * 0.50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ROMAIN MAHOT",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
