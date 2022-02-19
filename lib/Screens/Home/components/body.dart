import 'package:ap4_askhim/Screens/Categorie/categorie_screens.dart';
import 'package:ap4_askhim/Screens/servicePage/servicePage.dart';
import 'package:ap4_askhim/components/card_bloc_rectangle.dart';
import 'package:ap4_askhim/components/card_bloc_rounded.dart';
import 'package:ap4_askhim/components/search_bar.dart';
import 'package:ap4_askhim/models/homeCategorieService.dart';
import 'package:ap4_askhim/models/homeRecentService.dart';
import 'package:ap4_askhim/models/homeShuffleService.dart';
import 'package:ap4_askhim/services/home_service.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

List<IconData> category_list = [
  Icons.airport_shuttle,
  Icons.shopping_bag,
  Icons.auto_stories,
  Icons.sports_football,
  Icons.cleaning_services
];

class _BodyState extends State<Body> {
  Future<List<RecentService?>?>? _recentServices;
  Future<List<ShuffleService?>?>? _shuffleServices;
  Future<List<CategorieService?>?>? _categorieServices;

  @override
  initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    _recentServices = HomeService.getRecentService();
    _shuffleServices = HomeService.getShuffleService();
    _categorieServices = HomeService.getCategoriesServices();
    setState(() {});
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RefreshIndicator(
        onRefresh: getData,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.13),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15, top: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Services récents",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Container(
                      height: 150,
                      child: FutureBuilder<List<RecentService?>?>(
                        future: _recentServices,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              separatorBuilder: (context, _) =>
                                  SizedBox(width: 8),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var service = snapshot.data![index];

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => servicePage(
                                          id: service!.id,
                                        ),
                                      ),
                                    );
                                  },
                                  child: buildCard(
                                      borderRadius: 15,
                                      width: 150,
                                      height: 150,
                                      linkImage: service!.type.defaultPhoto,
                                      titleCard: service.name,
                                      prix: "${service.price}€",
                                      sizeTitle: 15,
                                      sizeSubtitle: 15),
                                );
                              },
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 6.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Catégories",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Container(
                      height: 150,
                      child: FutureBuilder<List<CategorieService?>?>(
                        future: _categorieServices,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                                separatorBuilder: (context, _) =>
                                    SizedBox(width: 8),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  var categories = snapshot.data![index];

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => CategoriePage(
                                              id: categories!.id,
                                              nom: categories.libelle),
                                        ),
                                      );
                                    },
                                    child: buildCardRounded(
                                      borderRadius: 15,
                                      width: 100,
                                      height: 100,
                                      linkImage:
                                          'https://images.unsplash.com/photo-1641550435860-1370d80c36e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1705&q=80',
                                      titleCard: categories!.libelle,
                                      sizeTitle: 15,
                                      sizeSubtitle: 15,
                                      icon: Icon(category_list[index]),
                                    ),
                                  );
                                });
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15, top: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Fil d'actualité",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    //TODO add infinite scroll
                    Container(
                      height: size.width * 5.05,
                      child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            FutureBuilder<List<ShuffleService?>?>(
                                future: _shuffleServices,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        var service = snapshot.data![index];

                                        return buildCard(
                                          borderRadius: 15,
                                          width: double.infinity,
                                          height: double.infinity,
                                          linkImage: service!.photos.isEmpty
                                              ? service.type.defaultPhoto
                                              : service.photos[0].libelle
                                                  .toString(),
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
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                })
                          ]),
                    ),
                  ],
                ),
                SearchBar(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
