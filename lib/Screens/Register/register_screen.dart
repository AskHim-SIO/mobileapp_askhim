import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/body.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true, //appbar transparent
        resizeToAvoidBottomInset:
            true, //permet de remonter les input quand le clavier apparait
        backgroundColor: Colors.white,
        body: NestedScrollView(
          // permet de cacher l'appbar quand la page descend
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  )),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
          ],
          body: Body(),
        ));
  }
}
