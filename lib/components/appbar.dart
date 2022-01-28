import 'package:ap4_askhim/Screens/Add/add_screen.dart';
import 'package:ap4_askhim/Screens/Chat/chat_screen.dart';
import 'package:ap4_askhim/Screens/Home/home_screen.dart';
import 'package:ap4_askhim/Screens/Message/message_screen.dart';
import 'package:ap4_askhim/Screens/Search/search_screen.dart';
import 'package:ap4_askhim/Screens/Profile/profile_screen.dart';
import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants.dart';

class appBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(1000);
  _appBar createState() => _appBar();
}

class _appBar extends State<appBar> {
  int _selectedIndex = 0;

  final screens = [
    HomeScreen(
      key: PageStorageKey('Home page'),
    ),
    SearchScreen(
      key: PageStorageKey('Search page'),
    ),
    AddScreen(
      key: PageStorageKey('Add page'),
    ),
    MessageScreen(
      key: PageStorageKey('Message page'),
    ),
    ProfileScreen(
      key: PageStorageKey('Profile page'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Future<void> _onItemTapped(int index) async {
    var box = await Hive.openBox('tokenBox');
    if (box.get('Token') == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
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
