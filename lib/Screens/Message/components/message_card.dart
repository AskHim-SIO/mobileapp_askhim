import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.nomUser,
    required this.photo,
    required this.nomService,
    required this.press,
  }) : super(key: key);

  final String nomUser, nomService, photo;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            SizedBox(height: size.width * 0.02),
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(photo),
                    ),
                  ],
                ),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nomService,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 7),
                      Opacity(
                        opacity: 0.64,
                        child: Text(
                          nomUser,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                )),
                //Opacity(opacity: 0.64, child: Text(message.time)),
              ],
            ),
            SizedBox(height: size.width * 0.03),
            Divider()
          ],
        ),
      ),
    );
  }
}
