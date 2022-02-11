import 'package:ap4_askhim/components/card_bloc_rectangle.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/categorieServicePage.dart';
import 'package:ap4_askhim/services/categorie_service.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final int id;
  Body({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<CategorieServicePage?>?>? _serviceyCat;

  @override
  void initState() {
    _serviceyCat = CategorieService.getServiceByCat(widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          height: size.width * 5.05,
          child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                FutureBuilder<List<CategorieServicePage?>?>(
                    future: _serviceyCat,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var service = snapshot.data![index];

                            return buildCard(
                              borderRadius: 15,
                              width: double.infinity,
                              height: double.infinity,
                              linkImage: service!.photos[0].libelle.toString(),
                              titleCard: service.name,
                              prix: '${service.price}€',
                              sizeTitle: 15,
                              sizeSubtitle: 15,
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    })
              ]),
        ),
      ),
    );
  }
}
