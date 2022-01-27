import 'package:ap4_askhim/Screens/Add/add_screen.dart';
import 'package:ap4_askhim/Screens/Home/home_screen.dart';
import 'package:ap4_askhim/Screens/Message/message_screen.dart';
import 'package:ap4_askhim/Screens/Search/search_screen.dart';
import 'package:ap4_askhim/Screens/Profile/profile_screen.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

// ignore: camel_case_types
class appBar extends StatefulWidget implements PreferredSizeWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(1000);
  @override
  _appBar createState() => _appBar();
}

// ignore: camel_case_types
class _appBar extends State<appBar> {
  int _selectedIndex = 0;

  final screens = [
    const HomeScreen(
      key: PageStorageKey('Home page'),
    ),
    const SearchScreen(
      key: PageStorageKey('Search page'),
    ),
    const AddScreen(
      key: PageStorageKey('Add page'),
    ),
    const MessageScreen(
      key: PageStorageKey('Message page'),
    ),
    const ProfileScreen(
      key: PageStorageKey('Profile page'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(child: screens[_selectedIndex], bucket: bucket),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
      ),
    );
  }
}
