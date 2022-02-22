import 'package:flutter/material.dart';
import 'components/body.dart';

class ModifProfile extends StatefulWidget {
  final Function() notifyParent;
  const ModifProfile({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<ModifProfile> createState() => _ModifProfileState();
}

class _ModifProfileState extends State<ModifProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(notifyParent: widget.notifyParent),
    );
  }
}
