import 'package:ap4_askhim/Screens/Add/components/input.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class TacheMenagere extends StatelessWidget {
  final TextEditingController materielController;
  final TextEditingController nbHeureMenageController;
  final TextEditingController typeTacheController;

  const TacheMenagere(
      {Key? key,
      required this.materielController,
      required this.nbHeureMenageController,
      required this.typeTacheController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: greyInput,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Input(
                  inputHint: 'De quoi avez-vous besoin ?',
                  libelle: 'Materiel :',
                  controller: materielController,
                  size: 0.60),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Input(
                    inputHint: 'Pour quelle tâche ?',
                    libelle: 'Type de tache :',
                    controller: typeTacheController,
                    size: 0.45),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Input(
                    inputHint: '5',
                    libelle: 'Nomdre d\'heures :',
                    controller: nbHeureMenageController,
                    textInputType: TextInputType.number,
                    size: 0.40),
              ),
            ],
          ),
        ));
  }
}
