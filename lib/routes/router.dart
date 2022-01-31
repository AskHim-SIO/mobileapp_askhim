import 'package:ap4_askhim/Screens/Add/add_screen.dart';
import 'package:ap4_askhim/Screens/Categorie/categorie_screens.dart';
import 'package:ap4_askhim/Screens/Chat/chat_screen.dart';
import 'package:ap4_askhim/Screens/Chat/components/message.dart';
import 'package:ap4_askhim/Screens/Home/home_screen.dart';
import 'package:ap4_askhim/Screens/Login/login_screen.dart';
import 'package:ap4_askhim/Screens/Profile/profile_screen.dart';
import 'package:ap4_askhim/Screens/Register/register_screen.dart';
import 'package:ap4_askhim/Screens/Search/search_screen.dart';
import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart';
import 'package:ap4_askhim/components/appbar.dart';
import 'package:ap4_askhim/main.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: [
    AutoRoute(path: "/", page: appBar, children: [
      AutoRoute(path: "welcome", name: "welcomeRouter", page: WelcomeScreen),
      AutoRoute(path: "register", name: "registerRouter", page: RegisterScreen),
      AutoRoute(path: "login", name: "loginRouter", page: LoginScreen),
      AutoRoute(
        path: "home",
        name: 'homeRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: HomeScreen),
          AutoRoute(
            path: ":categorieId",
            page: CategoriePage,
          )
        ],
      ),
      AutoRoute(
        path: 'search',
        name: 'searchRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: SearchScreen),
          AutoRoute(
            path: ':categorieId',
            page: CategoriePage,
          )
        ],
      ),
      AutoRoute(
        path: 'add',
        name: 'addRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: AddScreen),
        ],
      ),
      AutoRoute(
          path: 'message',
          name: 'messageRouter',
          page: EmptyRouterPage,
          children: [AutoRoute(path: "", page: ChatScreen)]),
      AutoRoute(
          path: 'profile',
          name: 'profileRouter',
          page: ProfileScreen,
          children: [AutoRoute(path: "welcome", page: WelcomeScreen)]),
    ]),
  ],
)
class $AppRouter {}
