import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Rechercher',
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
