import 'package:ap4_askhim/Screens/Add/components/course.dart';
import 'package:ap4_askhim/Screens/Add/components/transport.dart';
import 'package:flutter/material.dart';

class DynamicCard extends StatefulWidget {
  final int id;
  final TextEditingController motifController;
  final TextEditingController departController;
  final TextEditingController arriveeController;
  final TextEditingController vehiculeController;
  final TextEditingController nbPlacesController;
  final TextEditingController typeLieuController;
  final bool accompagnement;

  DynamicCard(
      {Key? key,
      required this.id,
      required this.motifController,
      required this.departController,
      required this.arriveeController,
      required this.vehiculeController,
      required this.nbPlacesController,
      required this.typeLieuController,
      required this.accompagnement})
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
          return Container(child: Text('Formation'));

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
