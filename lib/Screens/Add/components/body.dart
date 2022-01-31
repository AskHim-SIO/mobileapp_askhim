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
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('failed to pick image $e');
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(children: [
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
                    image != null
                        ? Image.file(image!, width: 100, height: 100)
                        : Text('pas d\'image')
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
