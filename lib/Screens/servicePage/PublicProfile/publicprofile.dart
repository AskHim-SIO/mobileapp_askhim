import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/models/serviceByUser.dart';
import 'package:ap4_askhim/models/userInfo.dart';
import 'package:ap4_askhim/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:hive/hive.dart';
import '../../../constants.dart';
import '../servicePage.dart';

class PublicProfile extends StatefulWidget {
  final int id;
  PublicProfile({Key? key, required this.id}) : super(key: key);

  @override
  _PublicProfileState createState() => _PublicProfileState();
}

var selected_Index = 0;

class _PublicProfileState extends State<PublicProfile> {
  bool visibilityService = true;
  bool visibilityEvaluation = false;
  Future<Map<String, dynamic>?>? _userInfo;
  Future<List<ServiceByUser?>?>? _servicesByUser;

  @override
  initState() {
    _userInfo = ProfileService.getUserInfoById(widget.id);

    _servicesByUser = ProfileService.getServicesByUserById(widget.id);
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true, //appbar transparent
        resizeToAvoidBottomInset:
            true, //permet de remonter les input quand le clavier apparait
        backgroundColor: Colors.white,
        body: NestedScrollView(
          // permet de cacher l'appbar quand la page descend
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              elevation: 0,
              backgroundColor: kPrimaryColor,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  )),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
          ],

          body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(children: [
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.width * 0.30,
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.width * 0.07,
                        child: Container(
                          child: CircleAvatar(
                            radius: size.width * 0.21,
                            backgroundColor: Colors.white,
                            child: FutureBuilder<Map<String, dynamic>?>(
                                future: _userInfo,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data!['profilPicture'] ==
                                        null) {
                                      return CircleAvatar(
                                        radius: size.width * 0.2,
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
                            return Text(
                              '${snapshot.data!['name']} ${snapshot.data!['firstname']}',
                              style: (TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                            );
                          } else {
                            return Text('');
                          }
                        }),
                  ),
                  SizedBox(height: size.width * 0.05),
                  ToggleSwitch(
                    minWidth: 130.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
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
                          height: size.height * 3.25,
                          child: ListView(
                              physics:
                                  const NeverScrollableScrollPhysics(), // new
                              children: [
                                FutureBuilder<List<ServiceByUser?>?>(
                                  future: _servicesByUser,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data!.isNotEmpty) {
                                        return ListView.separated(
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    const Divider(
                                                      indent:
                                                          50, // empty space to the leading edge of divider.
                                                      endIndent: 30,
                                                    ),
                                            physics:
                                                const NeverScrollableScrollPhysics(), // new

                                            shrinkWrap: true,
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, index) {
                                              var service =
                                                  snapshot.data![index];
                                              return Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) =>
                                                            servicePage(
                                                          id: service!.id,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Container(
                                                        width: size.width * 0.9,
                                                        height:
                                                            size.height * 0.09,
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                service!.photos
                                                                        .isEmpty
                                                                    ? service
                                                                        .type
                                                                        .defaultPhoto
                                                                    : service
                                                                        .photos[
                                                                            0]
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
                                                                      bottom:
                                                                          2.0),
                                                              child: Container(
                                                                width:
                                                                    size.width *
                                                                        0.75,
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            service.name,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                        const Spacer(),
                                                                        Text(
                                                                          '${DateTime.fromMillisecondsSinceEpoch(service.postDate).day}'
                                                                          ' '
                                                                          '${DateFormat('MMMM').format(DateTime(DateTime.fromMillisecondsSinceEpoch(service.postDate).month))}',
                                                                          style: const TextStyle(
                                                                              fontSize: 12,
                                                                              color: greyInputText),
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
                                                                                TextOverflow.ellipsis,
                                                                            style: TextStyle(fontSize: 12))),
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
                                      }
                                      return const Center(
                                          child: Padding(
                                        padding: EdgeInsets.only(top: 38.0),
                                        child: Text(
                                            'Vous n\'avez encore post?? aucun service',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ));
                                    } else {
                                      return Container(
                                          child: Column(children: <Widget>[
                                        SizedBox(height: size.width * 0.3),
                                        Center(
                                            child: CircularProgressIndicator())
                                      ]));
                                    }
                                  },
                                ),
                              ]),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 38.0),
                          child: Container(
                              child: Text(
                                  'Disponible dans une prochaine mise ?? jour !',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                        )
                ],
              ),
            ]),
          ),
        ));
  }
}
