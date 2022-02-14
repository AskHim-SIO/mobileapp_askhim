import 'dart:io';
import 'package:ap4_askhim/Screens/Add/components/adresse_container.dart';
import 'package:ap4_askhim/Screens/Add/components/dynamic_button.dart';
import 'package:ap4_askhim/Screens/Add/components/dynamic_card.dart';
import 'package:ap4_askhim/Screens/Add/components/input.dart';
import 'package:ap4_askhim/components/big_input.dart';
import 'package:ap4_askhim/components/input_basic_form.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/services/add_service.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/homeCategorieService.dart';
import 'package:ap4_askhim/services/home_service.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final adresseController = TextEditingController();
  final priceController = TextEditingController();
  final dateStartController = TextEditingController();
  final dateEndController = TextEditingController();
  final motifController = TextEditingController();
  final departController = TextEditingController();
  final arriveeController = TextEditingController();
  final vehiculeController = TextEditingController();
  final nbPlacesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<List<CategorieService?>?>? _categorieServices;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? images = [];
  String? value;

  @override
  initState() {
    _categorieServices = HomeService.getCategoriesServices();
    super.initState();
  }

  void pickImage() async {
    final XFile? selected =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selected != null && selected.path.isNotEmpty) {
      images!.add(selected);
    }
    setState(() {});
  }

  getButton(int id) {
    switch (id) {
      case 1:
        return RoundedButton(
          text: 'Ajouter le transport',
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
                  vehiculeController.text);
            }
            print('ok');
          },
        );
      case 2:
        return RoundedButton(
          text: 'Ajouter le transport',
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
                  vehiculeController.text);
            }
            print('ok');
          },
        );
      case 3:
        return Text('formation');
      case 4:
        return Text('loisir');
      case 5:
        return Text('menage');

        break;
      default:
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
            child: ListView(shrinkWrap: true, children: [
              Padding(
                  padding:
                      const EdgeInsets.only(right: 8, bottom: 8, left: 8.0),
                  child: Container(
                      child: Column(children: [
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Container(
                      height: size.width * 0.16,
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
                                    print(snapshot.data);

                                    return DropdownButton(
                                      hint: Text('Choisir un type de service'),
                                      value: value,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 30,
                                      elevation: 16,
                                      style:
                                          const TextStyle(color: Colors.black),
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
                          SizedBox(height: size.width * 0.02),
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
                                          //height: size.width * 0.15,
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
                                  SizedBox(height: size.width * 0.02),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Container(
                                      //height: size.width * 0.12,
                                      width: double.infinity,
                                      child: Input(
                                          libelle: 'Prix :',
                                          controller: priceController,
                                          inputHint: '5 AskCoins',
                                          textInputType: TextInputType.number),
                                    ),
                                  ),
                                  SizedBox(height: size.width * 0.02),

                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: const Text(
                                          'Date de Depart : ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          width: size.width * 0.5,
                                          child: TextFormField(
                                            controller: dateStartController,
                                            enableInteractiveSelection: false,
                                            onTap: () {
                                              // Below line stops keyboard from appearing
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      new FocusNode());

                                              DatePicker.showDatePicker(context,
                                                  showTitleActions: true,
                                                  minTime: DateTime(1980, 1, 1),
                                                  maxTime:
                                                      DateTime(2022, 12, 31),
                                                  onChanged: (date) {
                                                dateStartController.text =
                                                    '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                                              }, onConfirm: (date) {
                                                dateStartController.text =
                                                    '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                                              },
                                                  currentTime: DateTime.now(),
                                                  locale: LocaleType.fr);
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: "01/01/0001",
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
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
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
                                  SizedBox(height: size.width * 0.04),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: const Text(
                                          'Date d\'arrivée : ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          width: size.width * 0.5,
                                          child: TextFormField(
                                            controller: dateEndController,
                                            enableInteractiveSelection: false,
                                            onTap: () {
                                              // Below line stops keyboard from appearing
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      new FocusNode());

                                              DatePicker.showDatePicker(context,
                                                  showTitleActions: true,
                                                  minTime: DateTime(1980, 1, 1),
                                                  maxTime:
                                                      DateTime(2022, 12, 31),
                                                  onChanged: (date) {
                                                dateEndController.text =
                                                    '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                                              }, onConfirm: (date) {
                                                dateEndController.text =
                                                    '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                                              },
                                                  currentTime: DateTime.now(),
                                                  locale: LocaleType.fr);
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: "01/01/0001",
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
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
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
                                  SizedBox(height: size.width * 0.02),
                                ],
                              ),
                            )
                          : Container(),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    value != null
                        ? Container(
                            color: greyInput,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 8),
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
                                    height: size.width * 0.29,
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
                      height: size.width * 0.05,
                    ),
                    value != null
                        ? DynamicCard(
                            id: int.parse(value!),
                            arriveeController: arriveeController,
                            motifController: motifController,
                            vehiculeController: vehiculeController,
                            nbPlacesController: nbPlacesController,
                            departController: departController)
                        : Container(
                            height: size.width * 0.15,
                            color: greyInput,
                            width: double.infinity,
                            child: const Center(
                              child:
                                  Text('Veuillez choisir un type de service'),
                            ),
                          ),
                    value == null
                        ? Container()
                        : Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.width * 0.05,
                                ),
                                Container(
                                  //height: size.width * 0.47,
                                  width: double.infinity,
                                  color: greyInput,
                                  child: AdressContainer(
                                      hintText: 'Votre adresse',
                                      controller: adresseController,
                                      isText: true,
                                      labeltext: '3 rue des lilas'),
                                ),
                                SizedBox(
                                  height: size.width * 0.05,
                                ),
                                Container(
                                  height: size.width * 0.5,
                                  width: double.infinity,
                                  color: greyInput,
                                  child: Column(
                                    children: [
                                      SizedBox(height: size.width * 0.02),
                                      Expanded(
                                        child: Container(
                                          height: size.width * 0.1,
                                          child: GridView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: images!.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 1),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Card(
                                                clipBehavior: Clip.antiAlias,
                                                child: Stack(
                                                  children: <Widget>[
                                                    Image.file(
                                                        File(images![index]
                                                            .path),
                                                        fit: BoxFit.fill,
                                                        width: 300,
                                                        height: 600),
                                                    Positioned(
                                                      right: 5,
                                                      top: 5,
                                                      child: InkWell(
                                                        child: Container(
                                                          width: 20,
                                                          height: 20,
                                                          child: Icon(
                                                            Icons.remove_circle,
                                                            size: 20,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          deleteImage(index);
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
                                        onPressed: () {
                                          pickImage();
                                        },
                                        child: const Icon(Icons.add),
                                      ),
                                      SizedBox(height: size.width * 0.02)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.width * 0.05,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 20, right: 20, bottom: 5),
                                  child: Container(
                                    height: size.width * 0.20,
                                    width: double.infinity,
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
