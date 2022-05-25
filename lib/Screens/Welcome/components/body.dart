import 'package:ap4_askhim/Screens/Login/login_screen.dart';
import 'package:ap4_askhim/Screens/Register/register_screen.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Besoin d'aide ?",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: size.height * 0.05),
            Image.network("http://192.168.49.11/logo-black.png", width: size.width * 0.3),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Connexion",
              sizeButton: 0.6,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Inscription",
              sizeButton: 0.6,
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
