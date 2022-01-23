import 'package:ap4_askhim/Screens/Home/home_screen.dart';
import 'package:ap4_askhim/Screens/Register/register_screen.dart';
import 'package:ap4_askhim/components/appbar.dart';
import 'package:ap4_askhim/components/input_mail_form.dart';
import 'package:ap4_askhim/components/input_password_form.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/services/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var box = Hive.openBox('tokenBox');
  var incorrect = false;

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
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
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
            SizedBox(height: size.width * 0.25),
            InputFormMail(
              controller: emailController,
              hintText: 'Email',
              labelText: 'Email',
              borderRadius: 11,
            ),
            SizedBox(height: size.width * 0.04),
            InputFormPassword(
              controller: passwordController,
              hintText: 'Mot de passe',
              labelText: 'Mot de passe',
              borderRadius: 11,
            ),
            SizedBox(height: size.width * 0.02),
            Center(
              child: Visibility(
                visible: incorrect,
                child: Text('Email ou mot de passe incorrect',
                    style: TextStyle(color: Colors.red)),
              ),
            ),
            SizedBox(height: size.width * 0.14),
            RoundedButton(
                text: 'Se connecter',
                sizeButton: 0.8,
                press: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    setState(() {
                      incorrect = false;
                    });
                  }
                  if (_formKey.currentState!.validate()) {
                    AuthService.authenticate(
                            emailController.text, passwordController.text)
                        .then((val) {
                      if (val == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => appBar(),
                          ),
                        );
                        //TODO add mesage error
                      } else {
                        setState(() {
                          incorrect = true;
                        });
                      }
                    });
                  }
                  ;
                }),
            SizedBox(height: size.width * 0.01),
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
                        builder: (context) => RegisterScreen(),
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
