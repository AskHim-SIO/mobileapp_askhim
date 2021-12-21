import 'package:ap4_askhim/components/input_mail_form.dart';
import 'package:ap4_askhim/components/input_password_form.dart';

import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Se connecter",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Inter-SemiBold',
                  fontSize: 30),
            ),
            SizedBox(height: size.width * 0.5),
            const InputFormMail(
              hintText: 'Email',
              labelText: 'Email',
              borderRadius: 11,
            ),
            InputFormPassword(
              controller: emailController,
              hintText: 'Mot de passe',
              labelText: 'Mot de passe',
              borderRadius: 11,
            )
          ],
        ),
      ),
    );
  }
}
