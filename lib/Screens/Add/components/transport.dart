import 'package:ap4_askhim/Screens/Add/components/boolean_choice_input.dart';
import 'package:ap4_askhim/Screens/Add/components/input.dart';
import 'package:ap4_askhim/components/big_input.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class TransportCard extends StatelessWidget {
  TransportCard({Key? key}) : super(key: key);
  final motifController = TextEditingController();
  final departController = TextEditingController();
  final arriveeController = TextEditingController();
  final vehiculeController = TextEditingController();
  final nbPlacesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 1.055,
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
                  controller: departController,
                  inputHint: 'Départ',
                ),
                Input(
                  libelle: 'Point d\'arrivée :',
                  controller: arriveeController,
                  inputHint: 'Arivée',
                ),
                Input(
                    libelle: 'Nombre de place :',
                    controller: nbPlacesController,
                    inputHint: '5 places',
                    textInputType: TextInputType.number),
                Input(
                  libelle: 'Votre Véhicule :',
                  controller: vehiculeController,
                  inputHint: 'Nom du Véhicule',
                ),
                Container(
                  color: greyInput,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 8),
                        child: Text(
                          'Pourquoi vous déplacez-vous ? ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8.0, top: 14, left: 8),
                        child: Container(
                          height: size.width * 0.29,
                          width: double.infinity,
                          child: BigInput(
                            fillcolor: Colors.white,
                            labelText: 'Votre raison',
                            borderRadius: 15,
                            controller: motifController,
                            hintText: 'Votre titre',
                          ),
                        ),
                      ),
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
