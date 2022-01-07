import 'package:ap4_askhim/Screens/Home/home_screen.dart';
import 'package:ap4_askhim/components/search_bar.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

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
                          itemBuilder: (context, index) => buildCard())),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Catégories",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  buildCard(),
                  const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Fil d'actualité",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  buildCard(),
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

Widget buildCard() => Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 150,
        height: 150,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1641550435860-1370d80c36e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1705&q=80',
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(height: 2),
            const Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Nom du service un peui plus logn que da',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            const Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Prix',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
            )),
          ],
        ),
      ),
    );
