import 'package:ap4_askhim/Screens/Add/components/boolean_choice_input.dart';
import 'package:ap4_askhim/Screens/Add/components/input.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatefulWidget {
  CourseCard({Key? key}) : super(key: key);

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  final titleController = TextEditingController();

  String? value;

  List typelieu = ['lieu1', 'lieu2', 'lieu3'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.65,
      color: greyInput,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            Wrap(
              runSpacing: 10,
              children: [
                const boolChoice(libelle: 'Accompagnement :'),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    children: [
                      const Text(
                        'Type de lieu :',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const Spacer(flex: 8),
                      DropdownButton(
                        hint: Text('Choisir un type lieu'),
                        value: value,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (value) => setState(
                          () {
                            this.value = value.toString();
                          },
                        ),
                        items: typelieu.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
