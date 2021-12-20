import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/constants.dart';
import "package:flutter/material.dart";

import "package:ap4_askhim/Screens/Welcome/components/background.dart";

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Besoin d'aide ?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", width: size.width * 0.6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                  text: "Connexion",
                  press: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                  text: "Inscription",
                  color: kPrimaryLightColor,
                  textColor: Colors.black,
                  press: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
