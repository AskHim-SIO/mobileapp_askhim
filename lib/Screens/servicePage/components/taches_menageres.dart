import "package:flutter/material.dart";
import 'package:ap4_askhim/models/serviceDetails.dart';
import 'package:ap4_askhim/services/serviceDetails.dart';

class TachesMenageresCard extends StatefulWidget {
  final int idS;
  const TachesMenageresCard({Key? key, required this.idS}) : super(key: key);

  @override
  State<TachesMenageresCard> createState() => _TachesMenageresCardState();
}

class _TachesMenageresCardState extends State<TachesMenageresCard> {
  Future<Map<String, dynamic>?>? _service_details;
  initState() {
    _service_details = serviceDetails.getServiceDetails(widget.idS.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 319,
      child: FutureBuilder<Map<String, dynamic>?>(
        future: _service_details,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        snapshot.data!['type']['libelle'],
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nombre d'Heure : " +
                            snapshot.data!['nbHeure'].toString(),
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Type de Ménage : " + snapshot.data!['libelle'],
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Matériel : " + snapshot.data!['materiel'],
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Adresse : " +
                            snapshot.data!['lieu']['adresse'].toString(),
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Code Postal : " +
                            snapshot.data!['lieu']['codePostal'].toString(),
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Ville : " + snapshot.data!['lieu']['ville'].toString(),
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
