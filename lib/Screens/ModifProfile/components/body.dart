import 'package:ap4_askhim/Screens/ModifProfile/components/input.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../modifProfile_screen.dart';

class Body extends StatefulWidget {
  final nameController = TextEditingController();
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final telephoneController = TextEditingController();
  final adresseController = TextEditingController();
  final dateNaissController = TextEditingController();
  String? firstName;

  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Map<String, dynamic>?>? _userInfo;

  @override
  initState() {
    _userInfo = ProfileService.getUserInfo();
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(children: [
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
                    SizedBox(height: size.width * 0.02),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.white,
                              ), // Put icon of your preference.
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )),
                      ],
                    ),
                    SizedBox(height: size.width * 0.01),
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
            SizedBox(height: size.width * 0.24),
            Container(
              width: size.width * 0.8,
              child: FutureBuilder<Map<String, dynamic>?>(
                future: _userInfo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    widget.firstName = snapshot.data!['email'];
                    print(widget.firstName);
                    return Column(
                      children: [
                        Input(
                          libelle: 'Nom :',
                          controller: widget.firstNameController,
                          inputHint: '${snapshot.data!['name']}',
                        ),
                        Input(
                          libelle: 'Prénom :',
                          controller: widget.nameController,
                          inputHint: '${snapshot.data!['firstname']}',
                        ),
                        Input(
                          libelle: 'Email :',
                          controller: widget.emailController,
                          inputHint: '${snapshot.data!['email']}',
                        ),
                        Input(
                            libelle: 'Télephone :',
                            controller: widget.telephoneController,
                            inputHint: '${snapshot.data!['tel']}',
                            textInputType: TextInputType.number),
                        Input(
                          libelle: 'Adresse :',
                          controller: widget.adresseController,
                          inputHint: '${snapshot.data!['adresse']}',
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Date de Naissance : ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: size.width * 0.315,
                                child: TextFormField(
                                  controller: widget.dateNaissController,
                                  enableInteractiveSelection: false,
                                  onTap: () {
                                    // Below line stops keyboard from appearing
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());

                                    DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        minTime: DateTime(1980, 1, 1),
                                        maxTime: DateTime(2022, 12, 31),
                                        onChanged: (date) {
                                      widget.dateNaissController.text =
                                          '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                                    }, onConfirm: (date) {
                                      widget.dateNaissController.text =
                                          '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                                    },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.fr);
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "01/01/1001",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: const BorderSide(
                                          color: greyInputBorder),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: const BorderSide(
                                          color: greyInputBorder),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            SizedBox(
              height: 105,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15),
                child: RoundedButton(
                  press: () {
                    ProfileService.updateUser(
                        widget.adresseController.text,
                        widget.dateNaissController.text,
                        widget.emailController.text,
                        widget.firstNameController.text,
                        widget.nameController.text,
                        int.tryParse(widget.telephoneController.text) ?? 0);
                    initState() {
                      _userInfo = ProfileService.getUserInfo();
                    }
                  },
                  sizeButton: 17,
                  text: 'Modifier',
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
