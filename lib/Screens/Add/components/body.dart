import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:ap4_askhim/Screens/Add/components/adresse_container.dart';
import 'package:ap4_askhim/Screens/Add/components/dynamic_card.dart';
import 'package:ap4_askhim/Screens/Add/components/input.dart';
import 'package:ap4_askhim/Screens/servicePage/servicePage.dart';
import 'package:ap4_askhim/components/big_input.dart';
import 'package:ap4_askhim/components/input_basic_form.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/services/add_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/homeCategorieService.dart';
import 'package:ap4_askhim/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<bool> _accompagnement = [true, false];
  final List<bool> _accompagnementAnimal = [false, true];

  late Uint8List image;

  final List<bool> mode = [true, false];
  final _scrollController = ScrollController();
  final titleController = TextEditingController();
  final typeLieuController = TextEditingController();
  bool accompagnement = true;
  bool accompagnementAnimal = false;
  String modeFinal = 'Presentiel';
  final descriptionController = TextEditingController();
  final adresseController = TextEditingController();
  final priceController = TextEditingController();
  final dateStartController = TextEditingController();
  final dateEndController = TextEditingController();
  final motifController = TextEditingController();
  final departController = TextEditingController();
  final nbHeuresMenagesController = TextEditingController();
  final typeTacheController = TextEditingController();
  final arriveeController = TextEditingController();
  final vehiculeController = TextEditingController();
  final nbPlacesController = TextEditingController();
  final listeCourseController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final competenceController = TextEditingController();
  final materielController = TextEditingController();
  final loisirToDoController = TextEditingController();
  final nbPersonnesController = TextEditingController();
  final nbHeuresController = TextEditingController();
  final materielMenage = TextEditingController();

  Future<List<CategorieService?>?>? _categorieServices;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? images = [];
  List<Uint8List> imagebytes = [];
  String? value;

  @override
  initState() {
    _categorieServices = HomeService.getCategoriesServices();
    super.initState();
  }

  String imagepath = "";
  List<String> listImage = [];

  void pickImage() async {
    if (kIsWeb) {
      html.FileUploadInputElement input = html.FileUploadInputElement()
    ..accept = "image/*";
      input..click();
      input.onChange.listen((event) async {
        html.File file = input.files!.first;
        //print(file.name);
        //print(file.relativePath);
        // print(file);
        final reader = html.FileReader();
        reader.readAsArrayBuffer(file);
        await reader.onLoad.first;
        String base64string = base64.encode(
            reader.result as Uint8List); //convert bytes to base64 string

        //print(reader.result);

        setState(() {
          imagebytes.add(reader.result as Uint8List);
          listImage.add(base64string);
          print('ok');
          print(imagebytes.length);
        });
        //print('image' + imagebytes.toString());
        //print(base64string);
        //convert to bytes
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

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context, Datecontroller) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        Datecontroller.text =
        '${selectedDate.year}-${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}';
      });
    }
  }

  getButton(int id) {
    switch (id) {
      case 1:
        return RoundedButton(
          text: 'AskHim !',
          sizeButton: 12,
          press: () {
            if (_formKey.currentState!.validate()) {
              AddService.insertTransport(
                      dateStartController.text,
                      dateEndController.text,
                      descriptionController.text,
                      adresseController.text,
                      motifController.text,
                      titleController.text,
                      int.parse(nbPlacesController.text),
                      arriveeController.text,
                      departController.text,
                      int.parse(priceController.text),
                      vehiculeController.text)
                  .then((val) {
                if (listImage.isNotEmpty) {
                  for (int i = 0; i < listImage.length; i++) {
                    print("oui");
                    String finalString =
                        'data:image/png;base64,' + listImage[i];
                    AddService.postImage(int.parse(val), finalString);
                  }
                }
                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.of(context).pop(true);
                      });
                      return const AlertDialog(
                        title: Text('Votre service à bien été ajouté'),
                      );
                    });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => servicePage(
                      id: int.parse(val),
                    ),
                  ),
                );
              });
            }
          },
        );
      case 2:
        return RoundedButton(
          text: 'AskHim !',
          sizeButton: 12,
          press: () {
            if (_formKey.currentState!.validate()) {
              AddService.insertCourse(
                      dateEndController.text,
                      dateStartController.text,
                      accompagnement.toString(),
                      descriptionController.text,
                      adresseController.text,
                      listeCourseController.text,
                      typeLieuController.text,
                      titleController.text,
                      int.parse(priceController.text))
                  .then((val) {
                if (listImage.isNotEmpty) {
                  for (int i = 0; i < listImage.length; i++) {
                    String finalString =
                        'data:image/png;base64,' + listImage[i];
                    AddService.postImage(int.parse(val), finalString);
                  }
                }
                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.of(context).pop(true);
                      });
                      return const AlertDialog(
                        title: Text('Votre service à bien été ajouté'),
                      );
                    });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => servicePage(
                      id: int.parse(val),
                    ),
                  ),
                );
              });
            }
          },
        );
      case 3:
        return RoundedButton(
          text: 'AskHim !',
          sizeButton: 12,
          press: () {
            if (_formKey.currentState!.validate()) {
              AddService.insertFormations(
                      competenceController.text,
                      dateEndController.text,
                      dateStartController.text,
                      descriptionController.text,
                      adresseController.text,
                      materielController.text,
                      titleController.text,
                      int.parse(nbHeuresController.text),
                      modeFinal,
                      int.parse(priceController.text))
                  .then((val) {
                if (listImage.isNotEmpty) {
                  for (int i = 0; i < listImage.length; i++) {
                    String finalString =
                        'data:image/png;base64,' + listImage[i];
                    AddService.postImage(int.parse(val), finalString);
                  }
                }
                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.of(context).pop(true);
                      });
                      return const AlertDialog(
                        title: Text('Votre service à bien été ajouté'),
                      );
                    });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => servicePage(
                      id: int.parse(val),
                    ),
                  ),
                );
              });
            }
          },
        );
      case 4:
        return RoundedButton(
          text: 'AskHim !',
          sizeButton: 12,
          press: () {
            if (_formKey.currentState!.validate()) {
              AddService.insertLoisir(
                      accompagnementAnimal,
                      dateEndController.text,
                      dateStartController.text,
                      descriptionController.text,
                      loisirToDoController.text,
                      adresseController.text,
                      titleController.text,
                      int.parse(nbPersonnesController.text),
                      int.parse(priceController.text))
                  .then((val) {
                if (listImage.isNotEmpty) {
                  for (int i = 0; i < listImage.length; i++) {
                    String finalString =
                        'data:image/png;base64,' + listImage[i];
                    AddService.postImage(int.parse(val), finalString);
                  }
                }
                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.of(context).pop(true);
                      });
                      return const AlertDialog(
                        title: Text('Votre service à bien été ajouté'),
                      );
                    });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => servicePage(
                      id: int.parse(val),
                    ),
                  ),
                );
              });
            }
          },
        );
      case 5:
        return RoundedButton(
          text: 'AskHim !',
          sizeButton: 12,
          press: () {
            if (_formKey.currentState!.validate()) {
              AddService.insertMenage(
                      dateEndController.text,
                      dateStartController.text,
                      descriptionController.text,
                      typeTacheController.text,
                      adresseController.text,
                      materielMenage.text,
                      titleController.text,
                      int.parse(nbHeuresMenagesController.text),
                      int.parse(priceController.text))
                  .then((val) {
                if (listImage.isNotEmpty) {
                  for (int i = 0; i < listImage.length; i++) {
                    String finalString =
                        'data:image/png;base64,' + listImage[i];
                    AddService.postImage(int.parse(val), finalString);
                  }
                }
                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.of(context).pop(true);
                      });
                      return const AlertDialog(
                        title: Text('Votre service à bien été ajouté'),
                      );
                    });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => servicePage(
                      id: int.parse(val),
                    ),
                  ),
                );
              });
            }
          },
        );
      default:
    }
  }

  getBool() {
    setState(() {
      accompagnement = _accompagnement[0];
    });
  }

  getBoolAnimal() {
    setState(() {
      accompagnementAnimal = _accompagnement[0];
    });
  }

  getMode() {
    setState(() {
      if (mode[0]) {
        modeFinal = 'Presentiel';
      }
      if (!mode[0]) {
        modeFinal = 'Distanciel';
      }
    });
  }

  void deleteImage(int index) async {
    if(kIsWeb){
      imagebytes.removeAt(index);
      listImage.removeAt(index);
    }
    else {
      images!.removeAt(index);
      listImage.removeAt(index);
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: const Center(
                  child: Text("Ajouter un service",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold)))),
          backgroundColor: Colors.white,
          body: Center(
            child: ListView(
                controller: _scrollController,
                shrinkWrap: true,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(right: 8, bottom: 8, left: 8.0),
                      child: Container(
                          child: Column(children: [
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          //height: size.height * 0.10,
                          width: double.infinity,
                          color: greyInput,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Type :',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const Spacer(flex: 8),
                                  FutureBuilder<List<CategorieService?>?>(
                                    future: _categorieServices,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return DropdownButton(
                                          hint: Text(
                                              'Choisir un type de service'),
                                          value: value,
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          iconSize: 30,
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          onChanged: (value) => setState(
                                            () {
                                              this.value = value.toString();
                                            },
                                          ),
                                          items: snapshot.data!
                                              .map<DropdownMenuItem<String>>(
                                                  (value) {
                                            return DropdownMenuItem<String>(
                                              value: value!.id.toString(),
                                              child: Text(value.libelle),
                                            );
                                          }).toList(),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text("${snapshot.error}");
                                      }
                                      return CircularProgressIndicator();
                                    },
                                  ),
                                  Spacer(flex: 1),
                                ],
                              ),
                              SizedBox(height: size.height * 0.02),
                            ],
                          ),
                        ),
                        Container(
                          color: greyInput,
                          child: value != null
                              ? Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              'Titre : ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0, bottom: 8),
                                            child: Container(
                                              //height: size.height * 0.15,
                                              width: size.width * 0.6,
                                              child: InputBasicForm(
                                                fillcolor: Colors.white,
                                                labelText: 'Votre demande',
                                                borderRadius: 15,
                                                controller: titleController,
                                                hintText: 'Votre titre',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ), //
                                      SizedBox(height: size.height * 0.02),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Container(
                                          //height: size.height * 0.12,
                                          width: double.infinity,
                                          child: Input(
                                              libelle: 'Prix :',
                                              controller: priceController,
                                              inputHint: '5 AskCoins',
                                              textInputType:
                                                  TextInputType.number,
                                              size: 0.5),
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.02),

                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              'Date de début : ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Container(
                                              width: size.width * 0.5,
                                              child: TextFormField(
                                                controller: dateStartController,
                                                enableInteractiveSelection:
                                                    false,
                                                onTap: () {
                                                  // Below line stops keyboard from appearing
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          new FocusNode());

                                                  !kIsWeb ? DatePicker.showDatePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      minTime: DateTime.now()
                                                          .subtract(Duration(
                                                              days: 0)),
                                                      maxTime: DateTime(
                                                          2022, 12, 31),
                                                      onChanged: (date) {
                                                    dateStartController.text =
                                                        '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                                                  }, onConfirm: (date) {
                                                    dateStartController.text =
                                                        '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                                                  },
                                                      currentTime:
                                                          DateTime.now(),
                                                      locale: LocaleType.fr) : _selectDate(context, dateStartController);
                                                },
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: "01/01/0001",
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11),
                                                    borderSide: const BorderSide(
                                                        color: greyInputBorder),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.red),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.red),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11),
                                                    borderSide: const BorderSide(
                                                        color: greyInputBorder),
                                                  ),
                                                ),
                                                validator: (v) {
                                                  if (v!.isNotEmpty) {
                                                    return null;
                                                  } else {
                                                    return 'Veuillez renseignez votre date de naissance';
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: size.height * 0.04),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: const Text(
                                              'Date de fin : ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Container(
                                              width: size.width * 0.5,
                                              child: TextFormField(
                                                controller: dateEndController,
                                                enableInteractiveSelection:
                                                    false,
                                                onTap: () {
                                                  // Below line stops keyboard from appearing
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          new FocusNode());

                                                  !kIsWeb ? DatePicker.showDatePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      minTime: DateTime.now()
                                                          .subtract(Duration(
                                                              days: 0)),
                                                      maxTime: DateTime(
                                                          2022, 12, 31),
                                                      onChanged: (date) {
                                                    dateEndController.text =
                                                        '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                                                  }, onConfirm: (date) {
                                                    dateEndController.text =
                                                        '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                                                  },
                                                      currentTime:
                                                          DateTime.now(),
                                                      locale: LocaleType.fr) : _selectDate(context, dateEndController);
                                                },
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: "01/01/0001",
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11),
                                                    borderSide: const BorderSide(
                                                        color: greyInputBorder),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.red),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.red),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11),
                                                    borderSide: const BorderSide(
                                                        color: greyInputBorder),
                                                  ),
                                                ),
                                                validator: (v) {
                                                  if (v!.isNotEmpty) {
                                                    return null;
                                                  } else {
                                                    return 'Veuillez renseignez votre date de naissance';
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: size.height * 0.02),
                                    ],
                                  ),
                                )
                              : Container(),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        value != null
                            ? Container(
                                color: greyInput,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8),
                                      child: const Text(
                                        'Description : ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, top: 14, left: 8),
                                      child: Container(
                                        //height: size.height * 0.29,
                                        width: double.infinity,
                                        child: BigInput(
                                          fillcolor: Colors.white,
                                          labelText: 'Votre demande',
                                          borderRadius: 15,
                                          controller: descriptionController,
                                          hintText: 'Votre titre',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        value != null
                            ? DynamicCard(
                                id: int.parse(value!),
                                typeTacheController: typeTacheController,
                                nbHeureMenageController:
                                    nbHeuresMenagesController,
                                materielMenage: materielMenage,
                                arriveeController: arriveeController,
                                motifController: motifController,
                                vehiculeController: vehiculeController,
                                nbPlacesController: nbPlacesController,
                                departController: departController,
                                typeLieuController: typeLieuController,
                                accompagnement: accompagnement,
                                competenceController: competenceController,
                                nbHeuresController: nbHeuresController,
                                materielController: materielController,
                                nbPersonnesController: nbPersonnesController,
                                loisirToDoController: loisirToDoController,
                              )
                            : Container(
                                //height: size.height * 0.15,
                                color: greyInput,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: const Center(
                                    child: Text(
                                        'Veuillez choisir un type de service'),
                                  ),
                                ),
                              ),
                        value != null
                            ? int.parse(value!) == 2
                                ? Container(
                                    color: greyInput,
                                    child: Column(
                                      children: [
                                        Row(children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.0, top: 8, bottom: 12),
                                            child: Text(
                                              'Accompagnement :',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, right: 8.0, bottom: 12),
                                            child: Container(
                                              //height: size.height * 0.12,
                                              width: size.width * 0.4,
                                              child: ToggleButtons(
                                                children: [
                                                  Text('Oui'),
                                                  Text('Non')
                                                ],
                                                isSelected: _accompagnement,
                                                selectedColor: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                fillColor: kPrimaryColor,
                                                onPressed: (int index) {
                                                  setState(
                                                    () {
                                                      for (int i = 0;
                                                          i <
                                                              _accompagnement
                                                                  .length;
                                                          i++) {
                                                        _accompagnement[i] =
                                                            i == index;
                                                      }
                                                      getBool();
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        ]),
                                        accompagnement
                                            ? Container()
                                            : Column(children: [
                                                const Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8.0,
                                                          right: 8,
                                                          left: 8),
                                                  child: Text(
                                                    'Renseigner votre liste',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: BigInput(
                                                      controller:
                                                          listeCourseController,
                                                      hintText:
                                                          'Votre liste de course',
                                                      labelText:
                                                          'Liste de courses',
                                                      borderRadius: 10,
                                                      fillcolor: Colors.white),
                                                )
                                              ])
                                      ],
                                    ),
                                  )
                                : Container()
                            : Container(),
                        value != null
                            ? int.parse(value!) == 4
                                ? Container(
                                    color: greyInput,
                                    child: Column(children: [
                                      Row(children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0, top: 8, bottom: 12),
                                          child: Text(
                                            'Présence d\'un animal :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, right: 8.0, bottom: 12),
                                          child: Container(
                                            //height: size.height * 0.12,
                                            width: size.width * 0.4,
                                            child: ToggleButtons(
                                              children: [
                                                Text('Oui'),
                                                Text('Non')
                                              ],
                                              isSelected: _accompagnementAnimal,
                                              selectedColor: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              fillColor: kPrimaryColor,
                                              onPressed: (int index) {
                                                setState(
                                                  () {
                                                    for (int i = 0;
                                                        i <
                                                            _accompagnementAnimal
                                                                .length;
                                                        i++) {
                                                      _accompagnementAnimal[i] =
                                                          i == index;
                                                    }
                                                    getBoolAnimal();
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ])
                                    ]))
                                : Container()
                            : Container(),
                        value != null
                            ? int.parse(value!) == 3
                                ? Container(
                                    color: greyInput,
                                    child: Column(
                                      children: [
                                        Row(children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.0, top: 8, bottom: 12),
                                            child: Text(
                                              'Mode :',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, right: 8.0, bottom: 12),
                                            child: Container(
                                              //height: size.height * 0.12,
                                              width: size.width * 0.5,
                                              child: ToggleButtons(
                                                children: const [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text('Présentiel'),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text('Distanciel'),
                                                  )
                                                ],
                                                isSelected: mode,
                                                selectedColor: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                fillColor: kPrimaryColor,
                                                onPressed: (int index) {
                                                  setState(
                                                    () {
                                                      for (int i = 0;
                                                          i < mode.length;
                                                          i++) {
                                                        mode[i] = i == index;
                                                      }
                                                      getMode();
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        ]),
                                      ],
                                    ),
                                  )
                                : Container()
                            : Container(),
                        value == null
                            ? Container()
                            : Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),
                                    Container(
                                      //height: size.height * 0.47,
                                      width: double.infinity,
                                      color: greyInput,
                                      child: AdressContainer(
                                          hintText: 'Votre adresse',
                                          controller: adresseController,
                                          isText: true,
                                          labeltext: '3 rue des lilas'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),
                                    Container(
                                      height: size.height * 0.3,
                                      width: double.infinity,
                                      color: greyInput,
                                      child: Column(
                                        children: [
                                          SizedBox(height: size.height * 0.02),
                                          Expanded(
                                            child: Container(
                                              height: size.height * 0.1,
                                              child: GridView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: !kIsWeb ? images!.length : imagebytes.length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 1),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Card(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    child: Stack(
                                                      children: <Widget>[
                                                        !kIsWeb
                                                            ? Container(
                                                                child: Image.file(
                                                                    File(images![
                                                                            index]
                                                                        .path),
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    width: 300,
                                                                    height:
                                                                        600),
                                                              )
                                                            : Container(
                                                                color:
                                                                    Colors.red,
                                                                child: Image.memory(
                                                                    imagebytes[
                                                                            index]
                                                                        .buffer
                                                                        .asUint8List(),
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    width: 300,
                                                                    height:
                                                                        600),
                                                              ),
                                                        Positioned(
                                                          right: 5,
                                                          top: 5,
                                                          child: InkWell(
                                                            child: Container(
                                                              width: 20,
                                                              height: 20,
                                                              child: Icon(
                                                                Icons
                                                                    .remove_circle,
                                                                size: 20,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                            onTap: () {
                                                              deleteImage(
                                                                  index);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              pickImage();
                                              //final image = await ImagePickerWeb.getImageAsBytes();
                                            },
                                            child: const Icon(Icons.add),
                                          ),
                                          SizedBox(height: size.height * 0.02)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0,
                                          left: 20,
                                          right: 20,
                                          bottom: 5),
                                      child: Container(
                                        //height: size.height * 0.20,
                                        //width: double.infinity,
                                        color: Colors.transparent,
                                        child: getButton(int.parse(value!)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ]))),
                ]),
          ),
        ));
  }
}
