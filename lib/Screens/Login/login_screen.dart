import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import "package:ap4_askhim/Screens/Login/components/body.dart";
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return NestedScrollView(
              clipBehavior: Clip.none,
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
            );
          }
          else{
            return Center(child: Container(width:70.w,child: Body()));
          }
        },
      ),
    );
  }
}
