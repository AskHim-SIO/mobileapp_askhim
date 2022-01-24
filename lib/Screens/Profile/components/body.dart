import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:hive/hive.dart';
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
        selected_Index = index;
        visibilityService = true;
        visibilityEvaluation = false;
      }
      if (index == 1) {
        selected_Index = index;
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
      body: ListView(children: [
        Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: size.width * 0.50,
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
                    SizedBox(height: size.width * 0.05),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              Hive.box('tokenBox').clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ));
                            },
                            child: const Text(
                              'Déconnexion',
                              style: TextStyle(
                                fontSize: 14,
                                backgroundColor: kPrimaryColor,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
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
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: size.width * 0.27,
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
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                'Victoria Robertson',
                style: (TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
            visibilityService
                ? Container(
                    height: size.height * 3.25,
                    child: ListView(
                        physics: const NeverScrollableScrollPhysics(), // new

                        children: [
                          ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                              indent:
                                  50, // empty space to the leading edge of divider.
                              endIndent: 30,
                            ),
                            physics:
                                const NeverScrollableScrollPhysics(), // new

                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    width: size.width * 0.9,
                                    height: size.height * 0.09,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            'assets/images/background_welcome.png',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 2, bottom: 2.0),
                                          child: Container(
                                            width: size.width * 0.75,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Nom du service',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      'Date',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: greyInputText),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        'some text some text some text some text some text',
                                                        style: TextStyle(
                                                            fontSize: 12))),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: Container(
                        child: Text(
                            'Disponible dans une prochaine mise à jour !',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                  )
          ],
        ),
      ]),
    );
  }
}
