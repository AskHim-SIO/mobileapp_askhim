// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'components/body.dart';

// ignore: camel_case_types
class servicePage extends StatefulWidget {
  const servicePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<servicePage> createState() => _servicePageState();
}

// ignore: camel_case_types
class _servicePageState extends State<servicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(
        id: widget.id,
      ),
    );
  }
}
