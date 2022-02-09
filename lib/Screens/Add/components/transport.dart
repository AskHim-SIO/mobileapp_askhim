import 'package:ap4_askhim/Screens/Add/components/boolean_choice_input.dart';
import 'package:ap4_askhim/Screens/Add/components/input.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class TransportCard extends StatelessWidget {
  TransportCard({Key? key}) : super(key: key);
  final titleController = TextEditingController();

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
                Input(
                  libelle: 'Point de départ :',
                  controller: titleController,
                  inputHint: 'Départ',
                ),
                Input(
                  libelle: 'Point d\'arrivée :',
                  controller: titleController,
                  inputHint: 'Arivée',
                ),
                Input(
                    libelle: 'Nombre de place :',
                    controller: titleController,
                    inputHint: '5 places',
                    textInputType: TextInputType.number),
                const boolChoice(libelle: 'Vehicule Personnel :')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
