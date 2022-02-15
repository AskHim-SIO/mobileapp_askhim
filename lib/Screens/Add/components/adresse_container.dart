import 'dart:async';

import 'package:ap4_askhim/Screens/Add/components/adresse_input.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/adresse.dart';
import 'package:ap4_askhim/services/add_service.dart';
import 'package:flutter/material.dart';

class AdressContainer extends StatefulWidget {
  var controller;
  bool isText = true;
  String labeltext = '3 rue des lilas', hintText;

  AdressContainer(
      {Key? key,
      required this.controller,
      required this.isText,
      required this.labeltext,
      required this.hintText})
      : super(key: key);

  @override
  _AdressContainerState createState() => _AdressContainerState();
}

class _AdressContainerState extends State<AdressContainer> {
  Future<Adresse>? _adresses;

  String finalAdresse = "";
  Timer? _debounce;
  String? userTappedText;
  int? number = 5;
  int? count;

  @override
  void initState() {
    super.initState();
  }

  void changeFinalAdresse() {
    setState(() {
      finalAdresse = widget.controller.text;
    });
  }

  void dispose() {
    super.dispose();
  }

  void fillAdresses() {
    if (userTappedText != null) {
      if (userTappedText != '') {
        _adresses = AddService.getAdressesByQuery(userTappedText);
        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(const Duration(milliseconds: 1200), () {
          setState(() {});
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(10),
      child: Column(
        children: [
          widget.isText
              ? const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Renseigner votre adresse ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(8),
            child: InputAdress(
              finalAdresse: finalAdresse,
              onChanged: (text) {
                userTappedText = text;
                fillAdresses();
              },
              fillcolor: Colors.white,
              labelText: widget.labeltext.toString(),
              borderRadius: 15,
              controller: widget.controller,
              hintText: widget.hintText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 50,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 150, crossAxisCount: 1, mainAxisSpacing: 4),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: greyInputBorder, width: 0.5),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FutureBuilder<Adresse>(
                              future: _adresses,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var adresses = snapshot.data;
                                  if (adresses!.features.isEmpty) {
                                    return Text('Pas de resultat');
                                  } else if (adresses.features.length > 0) {
                                    return GestureDetector(
                                      onTap: () {
                                        widget.controller.text = adresses
                                            .features[index].properties.label;
                                        changeFinalAdresse();
                                      },
                                      child: Text(
                                        adresses
                                            .features[index].properties.label,
                                        style: TextStyle(
                                            color: kPrimaryColor, fontSize: 11),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                } else {
                                  return const Center(
                                      child: Text(
                                          'Veuillez entrer des informations'));
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
