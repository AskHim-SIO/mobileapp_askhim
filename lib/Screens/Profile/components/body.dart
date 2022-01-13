import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
            child: Expanded(
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
    );
  }
}
