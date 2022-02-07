import 'dart:io';
import 'package:ap4_askhim/Screens/Add/components/dynamic_card.dart';
import 'package:ap4_askhim/components/input_basic_form.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';

import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/homeCategorieService.dart';
import 'package:ap4_askhim/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final titleController = TextEditingController();
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
    if (selected!.path.isNotEmpty) {
      images!.add(selected);
    }
    setState(() {});
  }

  void deleteImage(int index) async {
    images!.removeAt(index);
    setState(() {});
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(shrinkWrap: true, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                const Text(
                  'Ajoute un service',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Container(
                  height: size.width * 0.30,
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
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (value) => setState(
                                    () {
                                      this.value = value.toString();
                                    },
                                  ),
                                  items: snapshot.data!
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value!.id.toString(),
                                      child: Text(value.libelle),
                                    );
                                  }).toList(),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              print('error');
                              return CircularProgressIndicator();
                            },
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                      SizedBox(height: size.width * 0.02),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: const Text(
                              'Votre demande: ',
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
                              height: size.width * 0.12,
                              width: size.width * 0.5,
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Container(
                    height: size.width * 0.5,
                    color: greyInput,
                    width: double.infinity,
                    child: value != null
                        ? DynamicCard(id: int.parse(value!))
                        : Center(
                            child:
                                Text('Veuillez choisir un type de service'))),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Container(
                    height: size.width * 0.15,
                    width: double.infinity,
                    color: greyInput,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: const Text(
                            'Adresse: ',
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
                            height: size.width * 0.12,
                            width: size.width * 0.5,
                            child: InputBasicForm(
                              fillcolor: Colors.white,
                              labelText: 'Adresse',
                              borderRadius: 15,
                              controller: titleController,
                              hintText: 'Adresse',
                            ),
                          ),
                        ),
                      ],
                    )),
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
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                child: Stack(
                                  children: <Widget>[
                                    Image.file(File(images![index].path),
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
                    child: RoundedButton(
                        text: 'Ajouter le service', sizeButton: 12),
                  ),
                ),
              ],
            ),
          ),
        )
      ])),
    );
  }
}
