import 'package:ap4_askhim/Screens/Categorie/categorie_screens.dart';
import 'package:ap4_askhim/Screens/Search/components/recent_service_page.dart';
import 'package:ap4_askhim/components/search_bar.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/models/homeCategorieService.dart';
import 'package:ap4_askhim/services/home_service.dart';
import 'package:flutter/material.dart';

import '../../../services/base_service.dart';

class BodyDesktop extends StatefulWidget {
  @override
  State<BodyDesktop> createState() => _BodyDesktopState();
}

class _BodyDesktopState extends State<BodyDesktop> {
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
                      SizedBox(height: size.height * 0.12),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecentServicePage(),
                              ));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: size.width,
                          color: greyInput,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             const Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'SERVICES RECENTS',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Image.network(
                                  BaseService.baseUri + '/Horloge.png'),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height:size.height * 0.01),
                      Container(
                        //height: size.height * 0.25,
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
                                        SizedBox(height: size.height * 0.01),
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      var categorie = snapshot.data![index];

                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CategoriePage(
                                                        nom: categorie!.libelle,
                                                        id: categorie.id),
                                              ));
                                        },
                                        child: Container(
                                          height: size.height * 0.20,
                                          width: size.width,
                                          color: greyInput,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 18.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
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
                      SizedBox(height:size.height * 0.01),
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
