import 'dart:io';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? images = [];

  void pickImage() async {
    try {
      final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        images!.addAll(selectedImages);
      }
    } on PlatformException catch (e) {
      print('failed to pick image $e');
    }
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
                  'Ajoute un service !',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      //shrinkWrap: true,
                      itemCount: images!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Image.file(File(images![index].path),
                            fit: BoxFit.cover, width: 100, height: 100);
                      }),
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Container(
                  height: size.width * 0.5,
                  width: double.infinity,
                  color: greyInput,
                  child: Column(children: [
                    ElevatedButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: const Text('image')),
                  ]),
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Container(
                  height: size.width * 0.15,
                  width: double.infinity,
                  color: greyInput,
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
                ),
              ],
            ),
          ),
        )
      ])),
    );
  }
}
