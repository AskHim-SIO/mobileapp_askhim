import 'dart:io';
import 'package:ap4_askhim/components/input_basic_form.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final titleController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? images = [];
  final items = [
    'Service 1',
    'Service 1',
    'Service 1',
    'Service 1',
    'Service 1'
  ];
  String? value;
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
                            padding: const EdgeInsets.only(left: 8.0),
                            child: const Text(
                              'Type de service :',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          Spacer(flex: 1),
                          DropdownButton<String>(
                            value: value,
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(
                              () {
                                this.value = value;
                              },
                            ),
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
                ),
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

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
