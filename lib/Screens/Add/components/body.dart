import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Ajouter',
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}