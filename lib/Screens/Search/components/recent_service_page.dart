import 'package:ap4_askhim/Screens/Search/components/body_service.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecentServicePage extends StatefulWidget {
  RecentServicePage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentServicePage> createState() => _RecentServicePageState();
}

class _RecentServicePageState extends State<RecentServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          // permet de cacher l'appbar quand la page descend
          floatHeaderSlivers: false,
          headerSliverBuilder: (context, innerBoxIScrolled) => [
            SliverAppBar(
              title: const Text('Service recents',
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
          body: Body(),
        ));
  }
}
