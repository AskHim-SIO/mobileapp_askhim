import 'package:ap4_askhim/Screens/Categorie/components/body.dart';
import 'package:ap4_askhim/components/appbar.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoriePage extends StatefulWidget {
  final int id;
  final String nom;
  CategoriePage({
    Key? key,
    required this.id,
    required this.nom,
  }) : super(key: key);

  @override
  State<CategoriePage> createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          // permet de cacher l'appbar quand la page descend
          floatHeaderSlivers: false,
          headerSliverBuilder: (context, innerBoxIScrolled) => [
            SliverAppBar(
              title: Text(widget.nom,
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold)),
              centerTitle: true,
              floating: true,
              pinned: true,
              snap: true,
              backgroundColor: Colors.white,
              elevation: 1,
              //backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  )),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
          ],
          body: Body(id: widget.id),
        ));
  }
}
