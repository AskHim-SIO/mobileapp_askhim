import 'package:ap4_askhim/constants.dart';
import 'package:ap4_askhim/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../Screens/Profile/profile_screen.dart' as profile;
import '../Screens/Home/home_screen.dart' as home;
import '../Screens/Search/search_screen.dart' as search;
import '../Screens/Add/add_screen.dart' as add;
import '../Screens/Message/message_screen.dart' as message;


class appBar extends StatefulWidget {
  appBar({Key? key}) : super(key: key);

  @override
  State<appBar> createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  int currentIndex = 0;

  Widget getSreens(index){
    List screens = const [
      home.HomeScreen(),
      search.SearchScreen(),
      add.AddScreen(),
      message.MessageScreen(),
      profile.ProfileScreen(),
    ];

    return screens[index];
  }

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
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
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
                    label: 'Messages',
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
            } else {
              return Row(
                children: [
                  NavigationRail(
                    labelType: NavigationRailLabelType.all,
                    selectedIndex: currentIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    destinations: const <NavigationRailDestination>[
                      NavigationRailDestination(
                        icon: Icon(Icons.home_outlined),
                        label: Text('Acceuil'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.search_outlined),
                        label: Text('Rechercher'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_circle_outline_outlined),
                        label: Text('Ajouter'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.mail_outline),
                        label: Text('Messages'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person_outlined),
                        label: Text('Profil'),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Expanded(child: getSreens(currentIndex)),
                ],
              );
            }
          },
        );
      },
    );
  }
}
