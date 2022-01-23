import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

var selected_Index = 0;

class _BodyState extends State<Body> {
  bool visibilityService = true;
  bool visibilityEvaluation = false;

  //methode pour afficher selon la toggle bar
  void _changed(int index) {
    setState(() {
      if (index == 0) {
        visibilityService = true;
        visibilityEvaluation = false;
      }
      if (index == 1) {
        visibilityEvaluation = true;
        visibilityService = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: size.width * 0.60,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.16,
                    left: size.width * 0.07,
                    right: size.width * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: const Text(
                        'Paramètres',
                        style: TextStyle(
                          fontSize: 16,
                          backgroundColor: kPrimaryColor,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
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
                    Spacer(),
                    Container(
                      child: const Text(
                        'Déconnexion',
                        style: TextStyle(
                          fontSize: 16,
                          backgroundColor: kPrimaryColor,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: size.width * 0.33,
                child: Container(
                  child: CircleAvatar(
                    radius: size.width * 0.21,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: size.width * 0.2,
                      backgroundColor: Colors.white,
                      backgroundImage: const NetworkImage(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Text(
              'Victoria Robertson',
              style: (TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Laisser une note',
              style: (TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(height: size.width * 0.05),
          ToggleSwitch(
            minWidth: 130.0,
            cornerRadius: 20.0,
            activeBgColors: [
              [Colors.white],
              [Colors.white]
            ],
            activeFgColor: kPrimaryColor,
            inactiveBgColor: greyInput,
            inactiveFgColor: greyInputText,
            borderColor: [greyInput],
            borderWidth: 2,
            initialLabelIndex: selected_Index,
            totalSwitches: 2,
            labels: ['Services', 'Evaluation'],
            radiusStyle: true,
            onToggle: (index) {
              _changed(index);
            },
          ),
          visibilityService ? Text('Services') : Text('Evaluation')
        ],
      ),
    );
  }
}
