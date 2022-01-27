import 'package:ap4_askhim/model/search_history_models.dart';
import 'package:flutter/material.dart';
import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:ap4_askhim/constants.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'components/appbar.dart';
import 'model/token_models.dart';

void main() async {
  // avoid rotation screen
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //
  await Hive.initFlutter();
  Hive.registerAdapter(TokenModelAdapter());
  Hive.registerAdapter(SearchHistoryModelAdapter());
  Hive.openBox('searchBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Inter'),
      home: FutureBuilder<Box>(
        future: Hive.openBox('tokenBox'),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data?.get('Token') != null) {
            return appBar();
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
