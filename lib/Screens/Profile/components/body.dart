import 'package:ap4_askhim/Screens/ModifProfile/modifProfile_screen.dart';
import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:ap4_askhim/Screens/servicePage/servicePage.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/models/serviceByUser.dart';
import 'package:ap4_askhim/models/userInfo.dart';
import 'package:ap4_askhim/services/profile_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:hive/hive.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

var selected_Index = 0;

class _BodyState extends State<Body> {
  bool visibilityService = true;
  bool visibilityEvaluation = false;
  Future<Map<String, dynamic>?>? _userInfo;
  Future<List<ServiceByUser?>?>? _servicesByUser;
  final _scrollController = ScrollController();

  @override
  initState() {
    getData();
    super.initState();
  }

  //methode pour afficher selon la toggle bar
  void _changed(int index) {
    setState(() {
      if (index == 0) {
        selected_Index = index;
        visibilityService = true;
        visibilityEvaluation = false;
      }
      if (index == 1) {
        selected_Index = index;
        visibilityEvaluation = true;
        visibilityService = false;
      }
    });
  }

  Future<void> getData() async {
    _userInfo = ProfileService.getUserInfo();

    _servicesByUser = ProfileService.getServicesByUser();
    setState(() {});
  }

  refresh() {
    setState(() {
      _userInfo = ProfileService.getUserInfo();
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: getData,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
            controller: _scrollController,
            children: [
          Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.25,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ModifProfile(notifyParent: refresh),
                                      ));
                                },
                                child: const Text(
                                  'Modifier',
                                  style: TextStyle(
                                    fontSize: 14,
                                    backgroundColor: kPrimaryColor,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              child: GestureDetector(
                                onTap: () {
                                  Hive.box('tokenBox').clear();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WelcomeScreen(),
                                      ));
                                },
                                child: const Text(
                                  'Déconnexion',
                                  style: TextStyle(
                                    fontSize: 14,
                                    backgroundColor: kPrimaryColor,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.06),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: const Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                backgroundColor: kPrimaryColor,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: size.height * 0.13,
                    child: Container(
                      child: CircleAvatar(
                        radius: !kIsWeb ? size.width * 0.21 :  size.width * 0.08 ,
                        backgroundColor: Colors.white,
                        child: FutureBuilder<Map<String, dynamic>?>(
                            future: _userInfo,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!['profilPicture'] == null) {
                                  return CircleAvatar(
                                    radius: kIsWeb ? size.width * 0.2 :  size.width * 0.06 ,
                                    backgroundColor: Colors.white,
                                    backgroundImage: const NetworkImage(
                                        'https://sbcf.fr/wp-content/uploads/2018/03/sbcf-default-avatar.png'),
                                  );
                                } else {
                                  return CircleAvatar(
                                      radius: size.width * 0.2,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                          snapshot.data!['profilPicture']));
                                }
                              } else {
                                return CircularProgressIndicator();
                              }
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: FutureBuilder<Map<String, dynamic>?>(
                    future: _userInfo,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            Text(
                              '${snapshot.data!['firstname']} ${snapshot.data!['name']}',
                              style: (TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: size.height * 0.02),
                            Text(
                              '${snapshot.data!['credit']} AskCoins 💰',
                              style: (TextStyle(fontSize: 18)),
                            ),
                          ],
                        );
                      } else {
                        return Text('');
                      }
                    }),
              ),
              SizedBox(height: size.height * 0.05),
              ToggleSwitch(
                minWidth: 130.0,
                cornerRadius: 20.0,
                activeBgColors: const [
                  [Colors.white],
                  [Colors.white]
                ],
                activeFgColor: kPrimaryColor,
                inactiveBgColor: greyInput,
                inactiveFgColor: greyInputText,
                borderColor: [greyInput],
                borderWidth: 2,
                initialLabelIndex: selected_Index,
                totalSwitches: 2,
                labels: ['Services', 'Evaluation'],
                radiusStyle: true,
                onToggle: (index) {
                  _changed(index!);
                },
              ),
              visibilityService
                  ? Container(
                      child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(), // new
                          children: [
                            FutureBuilder<List<ServiceByUser?>?>(
                              future: _servicesByUser,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.isNotEmpty) {
                                    return ListView.separated(
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const Divider(
                                                  thickness: 1,
                                                  indent:
                                                      50, // empty space to the leading edge of divider.
                                                  endIndent: 30,
                                                ),
                                        physics:
                                            const NeverScrollableScrollPhysics(), // new

                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          var service = snapshot.data![index];
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => servicePage(
                                                    id: service!.id,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: size.height * 0.06,
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundImage:
                                                              NetworkImage(
                                                            service!.photos
                                                                    .isEmpty
                                                                ? service.type
                                                                    .defaultPhoto
                                                                : service
                                                                    .photos[0]
                                                                    .libelle
                                                                    .toString(),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  top: 2,
                                                                  bottom: 2.0),
                                                          child: Container(
                                                            width: size.width *
                                                                0.75,
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        service
                                                                            .name,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '${DateTime.fromMillisecondsSinceEpoch(service.postDate).day}'
                                                                      ' '
                                                                      '${DateFormat('MMMM').format(DateTime(DateTime.fromMillisecondsSinceEpoch(service.postDate).month))}',
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              greyInputText),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const Spacer(),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Text(
                                                                        '${service.description}',
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  } else {
                                    return const Center(
                                        child: Padding(
                                      padding: EdgeInsets.only(top: 38.0),
                                      child: Text(
                                          'Vous n\'avez encore posté aucun service',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ));
                                  }
                                } else {
                                  return Container(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: size.height * 0.3),
                                        Center(
                                            child: CircularProgressIndicator())
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ]),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: Container(
                          child: Text(
                              'Disponible dans une prochaine mise à jour !',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                    )
            ],
          ),
        ]),
      ),
    );
  }
}
