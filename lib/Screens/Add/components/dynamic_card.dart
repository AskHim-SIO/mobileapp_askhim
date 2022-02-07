import 'package:flutter/material.dart';

class DynamicCard extends StatelessWidget {
  final int id;
  const DynamicCard({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget getIdInfos() {
      switch (id) {
        case 1:
          return Container(child: Text('Transport'));
        case 2:
          return Container(child: Text('Course'));

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
