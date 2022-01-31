import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/routes/router.gr.dart';
import 'package:ap4_askhim/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart' as welcome;

class appBar extends StatelessWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: [
          HomeRouter(),
          SearchRouter(),
          AddRouter(),
          MessageRouter(),
          ProfileRouter()
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                title: Text('Acceuil'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                title: Text('Rechercher'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_outlined),
                title: Text('Ajouter'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline),
                title: Text('Messages'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                title: Text('Profil'),
              ),
            ],
            currentIndex: tabsRouter.activeIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: kPrimaryColor,
            onTap: tabsRouter.setActiveIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
          );
        });
  }
}
