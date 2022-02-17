import 'package:ap4_askhim/Screens/Add/components/input.dart';
import 'package:ap4_askhim/components/big_input.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class LoisirCard extends StatelessWidget {
  final TextEditingController nbPersonnesController;
  final TextEditingController loisirToDoController;

  const LoisirCard(
      {Key? key,
      required this.nbPersonnesController,
      required this.loisirToDoController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    inputHint: '0',
                    textInputType: TextInputType.number,
                    libelle: 'Nombre de personnes',
                    controller: nbPersonnesController,
                    size: 0.3),
                Input(
                    inputHint: 'Que souhaitez-vous faire',
                    libelle: 'Loisir :',
                    controller: loisirToDoController,
                    size: 0.65),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
