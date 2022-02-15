import 'package:ap4_askhim/Screens/ModifProfile/components/input.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final nameController = TextEditingController();

  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: size.width * 0.50,
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
                    SizedBox(height: size.width * 0.05),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {},
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
                    SizedBox(height: size.width * 0.06),
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
                  top: size.width * 0.27,
                  child: Container(
                    child: CircleAvatar(
                      radius: size.width * 0.21,
                      backgroundColor: Colors.white,
                      child: FutureBuilder<Map<String, dynamic>?>(
                          future: _userInfo,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data!['profilPicture'] == null) {
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
                                          return Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Container(
                                                  width: size.width * 0.9,
                                                  height: size.height * 0.09,
                                                  child: Row(
                                                    children: [
                                                      service!.photos.isEmpty
                                                          ? const CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      'https://sbcf.fr/wp-content/uploads/2018/03/sbcf-default-avatar.png'),
                                                            )
                                                          : CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                service
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
                                                          width:
                                                              size.width * 0.80,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      service
                                                                          .name,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20),
                                                                    child: Text(
                                                                      '${DateTime.fromMillisecondsSinceEpoch(service.postDate).day}'
                                                                      ' '
                                                                      '${DateFormat('MMMM').format(DateTime(DateTime.fromMillisecondsSinceEpoch(service.postDate).month))}',
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              greyInputText),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const Spacer(),
                                                              Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                      service
                                                                          .description,
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
                                          );
                                        });
                                  } else {
                                    return Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 38.0),
                                        child: Container(
                                            child: Text(
                                                'Vous n\'avez encore posté aucun service',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ),
                                    );
                                  }
                                } else {
                                  return Container(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: size.width * 0.3),
                                        Center(
                                            child: CircularProgressIndicator())
                                      ],
                                    ),
                                  );
                                }
                              })
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
    );
  }
}
