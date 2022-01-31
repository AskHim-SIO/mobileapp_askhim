import 'package:ap4_askhim/components/search_bar.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/homeCategorieService.dart';
import 'package:ap4_askhim/services/home_service.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<CategorieService?>?>? _categorieServices;

  @override
  initState() {
    _categorieServices = HomeService.getCategoriesServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                child: ListView(children: [
                  Column(
                    children: [
                      SizedBox(height: size.width * 0.23),
                      Container(
                        height: size.width * 0.3,
                        width: size.width,
                        color: greyInput,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 18.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'SERVICES RECENTS',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Image.network(
                                  'http://cdn.askhim.ctrempe.fr/sacMobile.png'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: size.width * 0.04),
                      Container(
                        height: size.width * 1.7,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            FutureBuilder<List<CategorieService?>?>(
                              future: _categorieServices,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: size.width * 0.04),
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      var categorie = snapshot.data![index];

                                      return Container(
                                        height: size.width * 0.3,
                                        width: size.width,
                                        color: greyInput,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 18.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  categorie!.libelle
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Image.network(
                                                categorie.defaultPhotoMobile),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            SearchBar()
          ],
        ),
      ),
    );
  }
}
