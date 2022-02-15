import 'package:ap4_askhim/Screens/Add/components/card_by_services/course.dart';
import 'package:ap4_askhim/Screens/Add/components/card_by_services/transport.dart';
import 'package:flutter/material.dart';

import 'card_by_services/formation.dart';

class DynamicCard extends StatefulWidget {
  final int id;
  final TextEditingController motifController;
  final TextEditingController departController;
  final TextEditingController arriveeController;
  final TextEditingController vehiculeController;
  final TextEditingController nbPlacesController;
  final TextEditingController typeLieuController;
  final bool accompagnement;
  final TextEditingController competenceController;
  final TextEditingController materielController;

  final TextEditingController nbHeuresController;

  DynamicCard(
      {Key? key,
      required this.id,
      required this.motifController,
      required this.departController,
      required this.arriveeController,
      required this.vehiculeController,
      required this.nbPlacesController,
      required this.typeLieuController,
      required this.competenceController,
      required this.accompagnement,
      required this.materielController,
      required this.nbHeuresController})
      : super(key: key);

  @override
  State<DynamicCard> createState() => _DynamicCardState();
}

class _DynamicCardState extends State<DynamicCard> {
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget getIdInfos() {
      switch (widget.id) {
        case 1:
          return TransportCard(
              arriveeController: widget.arriveeController,
              motifController: widget.motifController,
              vehiculeController: widget.vehiculeController,
              nbPlacesController: widget.nbPlacesController,
              departController: widget.departController);
        case 2:
          return CourseCard(
              typeLieuController: widget.typeLieuController,
              value: widget.accompagnement);
        case 3:
          return FormationCard(
              competenceController: widget.competenceController,
              nbHeures: widget.nbHeuresController,
              materielController: widget.materielController);

        case 4:
          return Container(child: Text('Loisir'));

        case 5:
          return Container(child: Text('Tâche Ménagère'));

          break;
        default:
          return Text('');
      }
    }

    return getIdInfos();
  }
}
