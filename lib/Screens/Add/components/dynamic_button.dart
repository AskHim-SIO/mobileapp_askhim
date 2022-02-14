import 'package:ap4_askhim/Screens/Add/components/transport.dart';
import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:ap4_askhim/services/add_service.dart';
import 'package:flutter/material.dart';

class DynamicButton extends StatefulWidget {
  final int id, prix, nbplace;
  final String name, description, pointarriver, pointdepart;
  GlobalKey<FormState> formKey;
  final titleController = TextEditingController();
  final String dateDepart, dateArrivee, motif;

  DynamicButton(
      {Key? key,
      required this.id,
      required this.description,
      required this.nbplace,
      required this.motif,
      required this.formKey,
      required this.name,
      required this.prix,
      required this.dateDepart,
      required this.dateArrivee,
      required this.pointarriver,
      required this.pointdepart})
      : super(key: key);

  @override
  State<DynamicButton> createState() => _DynamicButtonState();
}

class _DynamicButtonState extends State<DynamicButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget getIdInfos() {
      switch (widget.id) {
        case 1:
          return RoundedButton(
            text: 'Ajouter le transport',
            sizeButton: 12,
            press: () {
              if (widget.formKey.currentState!.validate()) {
                //AddService.insertTransport(widget.dateArrivee, widget.dateDepart, widget.description, adresseComplete, motif, widget.name, nbPlaceDispo, pointArriver, pointDepart, widget.prix, userToken, vehiculePerso)
              }
            },
          );
        case 2:
          return RoundedButton(
            text: 'Ajouter le course',
            sizeButton: 12,
            press: () {
              if (widget.formKey.currentState!.validate()) {}
            },
          );
        case 3:
          return RoundedButton(
            text: 'Ajouter le formation',
            sizeButton: 12,
            press: () {
              if (widget.formKey.currentState!.validate()) {}
            },
          );

        case 4:
          return RoundedButton(
            text: 'Ajouter le loisir',
            sizeButton: 12,
            press: () {
              if (widget.formKey.currentState!.validate()) {}
            },
          );

        case 5:
          return RoundedButton(
            text: 'Ajouter le tâche ménagère',
            sizeButton: 12,
            press: () {
              if (widget.formKey.currentState!.validate()) {}
            },
          );

          break;
        default:
          return Text('');
      }
    }

    return getIdInfos();
  }
}
