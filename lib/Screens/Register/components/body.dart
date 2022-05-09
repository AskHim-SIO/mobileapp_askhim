import 'package:ap4_askhim/Screens/Login/login_screen.dart';
import 'package:ap4_askhim/Screens/Register/register_screen.dart';
import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:ap4_askhim/components/appbar.dart';
import 'package:ap4_askhim/components/form_verif.dart';
import 'package:ap4_askhim/components/input_basic_form.dart';
import 'package:ap4_askhim/components/input_date_form.dart';
import 'package:ap4_askhim/components/input_mail_form.dart';
import 'package:ap4_askhim/components/input_password_form.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/services/auth_service.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/foundation.dart';


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final subNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var mailAlreadyToken = false;

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        dateController.text =
        '${selectedDate.year}-${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: ListView(
          children: <Widget>[
            SizedBox(height: size.height * 0.10),
            const Center(
              child: Text(
                "S'inscrire",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Inter-SemiBold',
                    fontSize: 30),
              ),
            ),
            SizedBox(height: size.height * 0.10),
            InputBasicForm(
              controller: nameController,
              hintText: 'Nom',
              labelText: 'Nom',
              borderRadius: 11,
            ),
            SizedBox(height: size.height * 0.02),
            InputBasicForm(
              controller: subNameController,
              hintText: 'Prénom',
              labelText: 'Prénom',
              borderRadius: 11,
            ),
            SizedBox(height: size.height * 0.02),
            TextFormField(
              controller: dateController,
              enableInteractiveSelection: false,
              onTap: () {
                // Below line stops keyboard from appearing
                FocusScope.of(context).requestFocus(new FocusNode());

                !kIsWeb ? DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1980, 1, 1),
                    maxTime: DateTime(2022, 12, 31), onChanged: (date) {
                  dateController.text =
                      '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                }, onConfirm: (date) {
                  dateController.text =
                      '${date.year}-${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}';
                }, currentTime: DateTime.now(), locale: LocaleType.fr) :
                _selectDate(context);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: greyInput,
                hintText: "Date de naissance",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(color: greyInputBorder),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(color: greyInputBorder),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(color: greyInputBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(color: greyInputBorder),
                ),
              ),
              validator: (v) {
                if (v!.isNotEmpty) {
                  return null;
                } else {
                  return 'Veuillez renseignez votre date de naissance';
                }
              },
            ),
            SizedBox(height: size.height * 0.02),
            InputFormMail(
              controller: emailController,
              hintText: 'Email',
              labelText: 'Email',
              borderRadius: 11,
            ),
            SizedBox(height: size.height * 0.02),
            InputFormPassword(
              controller: passwordController,
              hintText: 'Mot de passe',
              labelText: 'Mot de passe',
              borderRadius: 11,
            ),
            SizedBox(height: size.height * 0.04),
            Center(
              child: Visibility(
                visible: mailAlreadyToken,
                child: Text('Cet email est déjà pris, veuillez vous connecter',
                    style: TextStyle(color: Colors.red)),
              ),
            ),
            SizedBox(height: size.height * 0.14),
            RoundedButton(
              text: 'S\'inscrire',
              sizeButton: 0.8,
              press: () {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    dateController.text.isEmpty ||
                    nameController.text.isEmpty ||
                    subNameController.text.isEmpty) {
                  setState(() {
                    mailAlreadyToken = false;
                  });
                }
                if (_formKey.currentState!.validate()) {
                  AuthService.signUp(
                    dateController.text,
                    emailController.text,
                    subNameController.text,
                    nameController.text,
                    passwordController.text,
                  ).then(
                    (val) {
                      if (val == true) {
                        context.router.pushNamed('/');
                      } else if (val == false) {
                        setState(() {
                          mailAlreadyToken = true;
                        });
                      }
                      ;
                    },
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.01),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Vous avez déjà un compte ?',
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Connectez-vous',
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
