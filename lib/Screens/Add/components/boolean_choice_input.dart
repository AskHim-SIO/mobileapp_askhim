import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class boolChoice extends StatefulWidget {
  final String libelle;
  const boolChoice({Key? key, required this.libelle}) : super(key: key);

  @override
  State<boolChoice> createState() => _boolChoiceState();
}

class _boolChoiceState extends State<boolChoice> {
  bool value = true;
  final List<bool> _selections = [true, false];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.libelle,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: size.width * 0.12,
              width: size.width * 0.4,
              child: ToggleButtons(
                  children: [Text('Oui'), Text('Non')],
                  isSelected: _selections,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  fillColor: kPrimaryColor,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _selections.length; i++) {
                        _selections[i] = i == index;
                      }
                    });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
