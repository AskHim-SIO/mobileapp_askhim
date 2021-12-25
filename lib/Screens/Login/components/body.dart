import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:ap4_askhim/components/input_mail_form.dart';
import 'package:ap4_askhim/components/input_password_form.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: size.width * 0.1),
            const Center(
              child: Text(
                "Se connecter",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Inter-SemiBold',
                    fontSize: 30),
              ),
            ),
            SizedBox(height: size.width * 0.2),
            const InputFormMail(
              hintText: 'Email',
              labelText: 'Email',
              borderRadius: 11,
            ),
            SizedBox(height: size.width * 0.04),
            InputFormPassword(
              controller: emailController,
              hintText: 'Mot de passe',
              labelText: 'Mot de passe',
              borderRadius: 11,
            ),
            SizedBox(height: size.width * 0.24),
            RoundedButton(
              text: 'Se connecter',
              sizeButton: 0.8,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: size.width * 0.01),
            const Center(
              child: Text(
                "Mot de passe oublié ?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontFamily: 'Inter-SemiBold',
                    fontSize: 15),
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Vous n\'avez pas encore de compte ?',
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Inscrivez-vous',
                    style: TextStyle(
                      color: Color(0xFF2B6CF2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
