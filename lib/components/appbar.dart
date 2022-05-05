import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class appBar extends StatelessWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
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
                label: 'Acceuil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                  label: 'Rechercher',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_outlined),
                  label: 'Ajouter',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline),
                label:'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: 'Profil',
              ),
            ],
            currentIndex: tabsRouter.activeIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: kPrimaryColor,
            onTap: tabsRouter.setActiveIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
          );
        });
  }
}
