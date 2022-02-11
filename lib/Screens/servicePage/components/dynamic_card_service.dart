import 'package:ap4_askhim/Screens/servicePage/components/course.dart';
import 'package:ap4_askhim/Screens/servicePage/components/formation.dart';
import 'package:ap4_askhim/Screens/servicePage/components/loisir.dart';
import 'package:ap4_askhim/Screens/servicePage/components/taches_menageres.dart';
import 'package:ap4_askhim/Screens/servicePage/components/transport.dart';
import 'package:flutter/material.dart';

class DynamicCardService extends StatefulWidget {
  final int id;
  final int idS;
  DynamicCardService({Key? key, required this.id, required this.idS})
      : super(key: key);

  @override
  State<DynamicCardService> createState() => _DynamicCardServiceState();
}

class _DynamicCardServiceState extends State<DynamicCardService> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget getIdInfo() {
      switch (widget.id) {
        case 1:
          return TransportCard(idS: widget.idS);
        case 2:
          return CourseCard(idS: widget.idS);
        case 3:
          return FormationCard(idS: widget.idS);

        case 4:
          return LoisirCard(idS: widget.idS);

        case 5:
          return TachesMenageresCard(idS: widget.idS);

          break;
        default:
          return Text('');
      }
    }

    return getIdInfo();
  }
}
