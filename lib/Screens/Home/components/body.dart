import 'package:ap4_askhim/Screens/Home/home_screen.dart';
import 'package:ap4_askhim/components/card_bloc_rectangle.dart';
import 'package:ap4_askhim/components/card_bloc_rounded.dart';
import 'package:ap4_askhim/components/search_bar.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

List<IconData> category_list = [
  Icons.add,
  Icons.delete,
  Icons.add,
  Icons.delete,
  Icons.add,
];

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.15),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
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
                    child: ListView.separated(
                      separatorBuilder: (context, _) => SizedBox(width: 8),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => buildCard(
                          borderRadius: 15,
                          width: 150,
                          height: 150,
                          linkImage:
                              'https://images.unsplash.com/photo-1641550435860-1370d80c36e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1705&q=80',
                          titleCard: 'Nom du service lambda',
                          subtitleCard: 'Prix',
                          sizeTitle: 15,
                          sizeSubtitle: 15),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
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
                    child: ListView.separated(
                      separatorBuilder: (context, _) => SizedBox(width: 8),
                      scrollDirection: Axis.horizontal,
                      itemCount: category_list.length,
                      itemBuilder: (context, index) => buildCardRounded(
                        borderRadius: 15,
                        width: 150,
                        height: 150,
                        linkImage:
                            'https://images.unsplash.com/photo-1641550435860-1370d80c36e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1705&q=80',
                        titleCard: 'Nom du service lambda',
                        sizeTitle: 15,
                        sizeSubtitle: 15,
                        icon: Icon(category_list[index]),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
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
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: 20,
                            itemBuilder: (context, index) => buildCard(
                                borderRadius: 15,
                                width: double.infinity,
                                height: double.infinity,
                                linkImage:
                                    'https://images.unsplash.com/photo-1641550435860-1370d80c36e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1705&q=80',
                                titleCard: 'Nom du service lambda',
                                subtitleCard: 'Prix',
                                sizeTitle: 15,
                                sizeSubtitle: 15),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              SearchBar(),
            ],
          )
        ],
      ),
    );
  }
}
