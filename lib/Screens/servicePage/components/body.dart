import 'package:ap4_askhim/Screens/Chat/chat_screen.dart';
import 'package:ap4_askhim/Screens/servicePage/PublicProfile/publicprofile.dart';
import 'package:ap4_askhim/Screens/servicePage/components/carousel.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/services/chat_services.dart';
import 'package:ap4_askhim/services/profile_service.dart';
import 'package:ap4_askhim/services/serviceDetails.dart';
import 'package:ap4_askhim/Screens/servicePage/components/dynamic_card_service.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final int id;
  Body({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Map<String, dynamic>?>? _service_details;
  Future<Map<String, dynamic>?>? _userInfos;
  int? status;
  bool incorrect = false;
  initState() {
    _service_details = serviceDetails.getServiceDetails(widget.id.toString());
    _userInfos = ProfileService.getUserInfo();
    super.initState();
  }

  String? value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0,
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                  )
                ]),
          ),
          carousel(id: widget.id),
          FutureBuilder<Map<String, dynamic>?>(
              future: _service_details,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              PublicProfile(id: snapshot.data!['user']['id']),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 15,
                            bottom: 15,
                          ),
                          child: FutureBuilder<Map<String, dynamic>?>(
                              future: _service_details,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Row(
                                    children: [
                                      snapshot.data!['user']['profilPicture'] ==
                                              null
                                          ? CircleAvatar(
                                              radius: size.width * 0.2,
                                              backgroundColor: Colors.white,
                                              backgroundImage: const NetworkImage(
                                                  'https://sbcf.fr/wp-content/uploads/2018/03/sbcf-default-avatar.png'),
                                            )
                                          : CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  snapshot.data!['user']
                                                      ['profilPicture'])),
                                      const SizedBox(
                                          width: kDefaultPadding * 0.50),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!['user']
                                                    ['firstname'] +
                                                " " +
                                                snapshot.data!['user']['name'],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 8),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: const CircularProgressIndicator());
                }
              }),
          FutureBuilder<Map<String, dynamic>?>(
            future: _service_details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    snapshot.data!['name'],
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder<Map<String, dynamic>?>(
            future: _service_details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, left: 8),
                  child: Center(
                    child: Text(
                      " Cr??er le : " +
                          '${DateTime.fromMillisecondsSinceEpoch(snapshot.data!['dateStart'])}'
                              .substring(0, 10),
                      //"Cr??er le : " + snapshot.data!['dateStart'].toString(),
                      style: const TextStyle(fontSize: 13, height: 1.0),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder<Map<String, dynamic>?>(
            future: _service_details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 18),
                  child: Center(
                    child: Text(
                      snapshot.data!['price'].toString() + " AskCoins",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          SizedBox(height: size.width * 0.04),
          FutureBuilder<Map<String, dynamic>?>(
            future: _service_details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, top: 15, right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                          )
                        ]),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 15, bottom: 10),
                          child: Row(children: [
                            const Text(
                              "Description :  ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Flexible(
                              child: Text(
                                snapshot.data!['description'],
                                style: const TextStyle(fontSize: 13),
                              ),
                            )
                          ]),
                        )),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder<Map<String, dynamic>?>(
            future: _service_details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, top: 15, right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                          )
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(width: kDefaultPadding * 0.50),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DynamicCardService(
                                  id: snapshot.data!["type"]["id"],
                                  idS: snapshot.data!["id"]),
                              const Text(
                                "",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          SizedBox(height: size.width * 0.05),
          Center(
            child: Visibility(
              visible: incorrect,
              child: const Text('Vous ne pouvez pas r??pondre ?? votre service',
                  style: TextStyle(color: Colors.red)),
            ),
          ),
          SizedBox(
            height: 105,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 35, right: 35, top: 15, bottom: 15),
              child: RoundedButton(
                sizeButton: 17,
                text: 'Envoyer un Message',
                press: () {
                  ProfileService.getServiceById(widget.id).then((valS) {
                    print(valS!['user']['id']);
                    ProfileService.getUserInfo().then((valU) {
                      print(valU!['id']);
                      if (valS['user']['id'] != valU['id']) {
                        ChatService.initDiscussion(widget.id).then(
                          (val) {
                            if (val == '409') {
                              //implementation du message d'erreur
                            } else {
                              ChatService.getDiscussionByUuid(val).then((val1) {
                                ProfileService.getUserInfo().then((val2) {
                                  final int idSender = val2!['id'];
                                  final int idReceiver;
                                  final String prenom, profilPicture, nom;
                                  final int idP;
                                  idSender == val1!['users'][0]['id']
                                      ? idP = val1['users'][1]['id']
                                      : idP = val1['users'][0]['id'];
                                  idSender == val1['users'][0]['id']
                                      ? idReceiver = val1['users'][1]['id']
                                      : idReceiver = val1['users'][0]['id'];
                                  idSender == val1['users'][0]['id']
                                      ? prenom = val1['users'][1]['firstname']
                                      : prenom = val1['users'][0]['firstname'];
                                  idSender == val1['users'][0]['id']
                                      ? profilPicture =
                                          val1['users'][1]['profilPicture']
                                      : profilPicture =
                                          val1['users'][0]['profilPicture'];
                                  idSender == val1['users'][0]['id']
                                      ? nom = val1['users'][1]['name']
                                      : nom = val1['users'][0]['name'];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ChatScreen(
                                              state: valS['state'],
                                              id: idP,
                                              prenom: prenom,
                                              photoProfil: profilPicture,
                                              nom: nom,
                                              uuid: val,
                                              idSender: idSender,
                                              idReceiver: idReceiver)));
                                });
                              });
                            }
                            ;
                          },
                        );
                      } else {
                        setState(() {
                          incorrect = true;
                        });
                      }
                    });
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
