import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:ap4_askhim/Screens/ModifProfile/components/input.dart';
import 'package:ap4_askhim/Screens/Profile/profile_screen.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/services/profile_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:io';

import '../modifProfile_screen.dart';

class Body extends StatefulWidget {
  final Function() notifyParent;

  Body({Key? key, required this.notifyParent}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Map<String, dynamic>?>? _userInfo;
  bool? admin;
  int? credit, id;
  String? profilPicture;
  String? name, firstName, email, adresse;
  int? tel, dateNaiss;

  final nameController = TextEditingController();
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final telephoneController = TextEditingController();
  final adresseController = TextEditingController();
  final dateNaissController = TextEditingController();
  final adminController = TextEditingController();
  final creditController = TextEditingController();
  final idController = TextEditingController();
  final profilPictureController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var incorrect = false;
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? images = [];

  @override
  initState() {
    _userInfo = ProfileService.getUserInfo();
    listImage = [];
    super.initState();
  }

  String imagepath = "";
  List<String> listImage = [];
  List<Uint8List> imagebytes = [];
  late Uint8List image;

  void pickImage() async {
    if (kIsWeb) {
      html.FileUploadInputElement input = html.FileUploadInputElement()
        ..accept = "image/*";
      input..click();
      input.onChange.listen((event) async {
        html.File file = input.files!.first;
        final reader = html.FileReader();
        reader.readAsArrayBuffer(file);
        await reader.onLoad.first;
        String base64string = base64.encode(
            reader.result as Uint8List); //convert bytes to base64 string
        setState(() {
          imagebytes.add(reader.result as Uint8List);
          listImage.add(base64string);
          print('ok');
          print(imagebytes.length);
        });
      });
    } else {
      final XFile? selected =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (selected != null && selected.path.isNotEmpty) {
        images!.add(selected);
        imagepath = selected.path;
        File imagefile = File(imagepath); //convert Path to File
        Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
        String base64string =
            base64.encode(imagebytes); //convert bytes to base64 string
        listImage.add(base64string);
        setState(() {});
      }
    }
  }

  void deleteImage(int index) async {
    images!.removeAt(index);
    setState(() {});
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
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
                      SizedBox(height: size.height * 0.02),
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
                      SizedBox(height: size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Center(
                            child: Text(
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
                      child: listImage.isEmpty
                          ? CircleAvatar(
                              radius: !kIsWeb
                                  ? size.width * 0.21
                                  : size.width * 0.08,
                              backgroundColor: Colors.white,
                              child: FutureBuilder<Map<String, dynamic>?>(
                                  future: _userInfo,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data!['profilPicture'] ==
                                          null) {
                                        return CircleAvatar(
                                          radius: kIsWeb
                                              ? size.width * 0.2
                                              : size.width * 0.06,
                                          backgroundColor: Colors.white,
                                          backgroundImage: const NetworkImage(
                                              'https://sbcf.fr/wp-content/uploads/2018/03/sbcf-default-avatar.png'),
                                        );
                                      } else {
                                        return CircleAvatar(
                                            radius: size.width * 0.2,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                snapshot
                                                    .data!['profilPicture']));
                                      }
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  }),
                            )
                          : !kIsWeb
                              ? Positioned(
                                  top: size.height * 0.13,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Image.file(File(images![0].path),
                                        fit: BoxFit.fill,
                                        width: size.width * 0.3,
                                        height: size.height * 0.13),
                                  ),
                                )
                              : Positioned(
                                  top: size.height * 0.13,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Image.memory(
                                        imagebytes[0].buffer.asUint8List(),
                                        fit: BoxFit.fill,
                                        width: size.width * 0.2,
                                        height: 600),
                                  ),
                                ),
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    right: 90,
                    child: RawMaterialButton(
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color: kPrimaryColor,
                          ),
                          child: const Icon(Icons.edit, color: Colors.white)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: const Text(
                                  'Choisissez une option',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: kPrimaryColor),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          pickImage();
                                        },
                                        splashColor: kPrimaryColor,
                                        child: Row(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.image,
                                                color: kPrimaryColor,
                                              ),
                                            ),
                                            Text('Galerie',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black))
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: kPrimaryColor,
                                        child: Row(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.remove_circle,
                                                color: kPrimaryColor,
                                              ),
                                            ),
                                            Text('Supprimer',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              kIsWeb ? SizedBox(height: size.height * 0.11) : SizedBox.shrink(),
              SizedBox(height: size.height * 0.12),
              Container(
                width: size.width * 0.8,
                child: FutureBuilder<Map<String, dynamic>?>(
                  future: _userInfo,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      SchedulerBinding.instance?.addPostFrameCallback((_) {
                        name = snapshot.data!['name'];
                        nameController.text = name.toString();
                        firstName = snapshot.data!['firstname'];
                        firstNameController.text = firstName.toString();
                        email = snapshot.data!['email'];
                        emailController.text = email.toString();
                        snapshot.data!['tel'] == null
                            ? tel = 0
                            : tel = snapshot.data!['tel'];
                        telephoneController.text = tel.toString();
                        snapshot.data!['address'] == null
                            ? adresse = '3 rue des lilas'
                            : adresse = snapshot.data!['address'];
                        adresseController.text = adresse.toString();
                        dateNaiss = snapshot.data!['dateNaiss'];
                      });

                      return Column(children: [
                        Wrap(
                          runSpacing: 20,
                          children: [
                            Input(
                              libelle: 'Nom :',
                              controller: nameController,
                              inputHint: '${snapshot.data!['name']}',
                            ),
                            Input(
                              libelle: 'Prénom :',
                              controller: firstNameController,
                              inputHint: '${snapshot.data!['firstname']}',
                            ),
                            Input(
                              libelle: 'Email :',
                              controller: emailController,
                              inputHint: '${snapshot.data!['email']}',
                            ),
                            Input(
                                libelle: 'Télephone :',
                                controller: telephoneController,
                                inputHint: '${snapshot.data!['tel']}',
                                textInputType: TextInputType.number),
                            Input(
                              libelle: 'Adresse :',
                              controller: adresseController,
                              inputHint: '${snapshot.data!['address']}',
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
                                      controller: dateNaissController,
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

                                          dateNaissController.text =
                                              '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                                        }, onConfirm: (date) {
                                          dateNaissController.text =
                                              '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                                        },
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.fr);
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "01/01/2001",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          borderSide: const BorderSide(
                                              color: greyInputBorder),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          borderSide: const BorderSide(
                                              color: Colors.red),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          borderSide: const BorderSide(
                                              color: Colors.red),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                        )
                      ]);
                    } else {
                      return Center(child: const CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Center(
                child: Visibility(
                  visible: incorrect,
                  child: Text('Veuillez remplir au moins un des champs',
                      style: TextStyle(color: Colors.red)),
                ),
              ),
              SizedBox(
                height: 105,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15),
                  child: RoundedButton(
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        if (listImage.isNotEmpty) {
                          ProfileService.updateUserPic(listImage[0])
                              .then((val) {
                                print(val);
                            val
                                ? ProfileService.updateUser(
                                        adresseController.text,
                                        admin,
                                        credit,
                                        dateNaissController.text,
                                        emailController.text,
                                        firstNameController.text,
                                        id,
                                        nameController.text,
                                        profilPicture,
                                        int.parse(telephoneController.text))
                                    .then((val) {
                                    if (val) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            Future.delayed(Duration(seconds: 3),
                                                () {
                                              Navigator.of(context).pop(true);
                                            });
                                            return const AlertDialog(
                                              title: Text(
                                                  'Votre profile à bien été modifié'),
                                            );
                                          });
                                      widget.notifyParent();
                                    }
                                  })
                                : showDialog(
                                    context: context,
                                    builder: (context) {
                                      Future.delayed(Duration(seconds: 3), () {
                                        Navigator.of(context).pop(true);
                                      });
                                      return const AlertDialog(
                                        title:
                                            Text("Erreur dans la modification"),
                                      );
                                    });
                          });
                        } else {
                          ProfileService.updateUser(
                                  adresseController.text,
                                  admin,
                                  credit,
                                  dateNaissController.text,
                                  emailController.text,
                                  firstNameController.text,
                                  id,
                                  nameController.text,
                                  profilPicture,
                                  int.parse(telephoneController.text))
                              .then((val) {
                            if (val) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(Duration(seconds: 3), () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return const AlertDialog(
                                      title: Text(
                                          'Votre profile à bien été modifié'),
                                    );
                                  });
                              widget.notifyParent();
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(Duration(seconds: 3), () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return const AlertDialog(
                                      title:
                                          Text("Erreur dans la modification"),
                                    );
                                  });
                            }
                          });
                        }
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
      ),
    );
  }
}
