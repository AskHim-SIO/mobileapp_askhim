import 'package:ap4_askhim/Screens/Add/components/input.dart';
import 'package:ap4_askhim/components/big_input.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class FormationCard extends StatelessWidget {
  final TextEditingController competenceController;
  final TextEditingController materielController;
  final TextEditingController nbHeures;

  const FormationCard(
      {Key? key,
      required this.competenceController,
      required this.materielController,
      required this.nbHeures})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: size.width * 1.5,
      color: greyInput,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            Wrap(
              runSpacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'Compétences à valider : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: BigInput(
                            hintText: 'Compétences',
                            borderRadius: 10,
                            labelText: 'Que voulez-vous apprendre ?',
                            controller: competenceController,
                            fillcolor: Colors.white),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Matériel requis : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BigInput(
                          hintText: 'De quoi avez-vous besoins ?',
                          borderRadius: 10,
                          labelText: 'Matériel requis',
                          controller: materielController,
                          fillcolor: Colors.white),
                    ),
                  ],
                ),
                Input(
                    libelle: 'Nombre d\'heures:',
                    controller: nbHeures,
                    inputHint: '5 heures',
                    textInputType: TextInputType.number),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
