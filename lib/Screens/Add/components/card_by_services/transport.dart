import 'package:ap4_askhim/Screens/Add/components/adresse_container.dart';
import 'package:ap4_askhim/Screens/Add/components/input.dart';
import 'package:ap4_askhim/components/big_input.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

class TransportCard extends StatefulWidget {
  final TextEditingController motifController;
  final TextEditingController departController;
  final TextEditingController arriveeController;
  final TextEditingController vehiculeController;
  final TextEditingController nbPlacesController;

  TransportCard(
      {Key? key,
      required this.motifController,
      required this.departController,
      required this.arriveeController,
      required this.vehiculeController,
      required this.nbPlacesController})
      : super(key: key);

  @override
  State<TransportCard> createState() => _TransportCardState();
}

class _TransportCardState extends State<TransportCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                AdressContainer(
                  hintText: 'Point de départ',
                  controller: widget.departController,
                  isText: true,
                  labeltext: 'Point de départ',
                ),
                AdressContainer(
                  hintText: 'Point d\'arrivée',
                  controller: widget.arriveeController,
                  isText: false,
                  labeltext: 'Point d\'arrivée',
                ),
                SizedBox(
                    height: size.width * 0.02,
                    child: Container(color: Colors.white)),
                Input(
                    libelle: 'Nombre de place :',
                    controller: widget.nbPlacesController,
                    inputHint: '5 places',
                    textInputType: TextInputType.number),
                Input(
                  libelle: 'Votre Véhicule :',
                  controller: widget.vehiculeController,
                  inputHint: 'Marque du véhicule',
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
                            controller: widget.motifController,
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
