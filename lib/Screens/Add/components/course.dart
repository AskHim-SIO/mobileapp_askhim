import 'package:ap4_askhim/Screens/Add/components/input.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatefulWidget {
  final TextEditingController typeLieuController;
  bool value;
  CourseCard({Key? key, required this.typeLieuController, required this.value})
      : super(key: key);

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: greyInput,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            Wrap(
              runSpacing: 10,
              children: [
                Input(
                    libelle: 'Type de lieu :',
                    controller: widget.typeLieuController,
                    inputHint: 'Boulangerie',
                    textInputType: TextInputType.text),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
