// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'components/body.dart';

// ignore: camel_case_types
class servicePage extends StatefulWidget {
  const servicePage(
      {Key? key,
      required this.id,
      required this.sizes,
      required this.name,
      required this.img,
      required this.price,
      required this.mulImg})
      : super(key: key);

  final String id, name, img, price;
  final List<String> mulImg;
  final List sizes;

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
          img: widget.img,
          mulImg: widget.mulImg,
          price: widget.price,
          sizes: widget.sizes,
          name: widget.name),
    );
  }
}
