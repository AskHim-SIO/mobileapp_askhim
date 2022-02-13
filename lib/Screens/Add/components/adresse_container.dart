import 'dart:async';

import 'package:ap4_askhim/Screens/Add/components/adresse_input.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/adresse.dart';
import 'package:ap4_askhim/services/add_service.dart';
import 'package:flutter/material.dart';

class AdressContainer extends StatefulWidget {
  final controller;

  const AdressContainer({Key? key, required this.controller}) : super(key: key);

  @override
  _AdressContainerState createState() => _AdressContainerState();
}

class _AdressContainerState extends State<AdressContainer> {
  Future<Adresse>? _adresses;

  String? finalAdresse;
  Timer? _debounce;
  String? userTappedText;
  int? number = 5;
  int? count;

  @override
  void initState() {
    super.initState();
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
      print(_adresses);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Renseigner votre adresse ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: InputAdress(
              onChanged: (text) {
                userTappedText = text;
                fillAdresses();
              },
              fillcolor: Colors.white,
              labelText: 'Exemple : 3 rue des lilas',
              borderRadius: 15,
              controller: widget.controller,
              hintText: 'Votre titre',
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
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
                                    return Text(
                                      adresses.features[index].properties.label,
                                      style: TextStyle(
                                          color: kPrimaryColor, fontSize: 11),
                                      textAlign: TextAlign.center,
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
