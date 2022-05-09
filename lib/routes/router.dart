import 'package:ap4_askhim/Screens/Add/add_screen.dart' as add;
import 'package:ap4_askhim/Screens/Categorie/categorie_screens.dart';
import 'package:ap4_askhim/Screens/Home/home_screen.dart' as home;
import 'package:ap4_askhim/Screens/Login/login_screen.dart';
import 'package:ap4_askhim/Screens/Profile/profile_screen.dart';
import 'package:ap4_askhim/Screens/Register/register_screen.dart';
import 'package:ap4_askhim/Screens/Search/search_screen.dart' as search;
import 'package:ap4_askhim/Screens/Welcome/welcome_screens.dart' as welcome;
import 'package:ap4_askhim/components/appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
import 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: [
    AutoRoute(path: "/", page: appBar, children: [
      AutoRoute(
        path: "home",
        name: 'homeRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: home.HomeScreen),
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
          AutoRoute(path: "", page: search.SearchScreen),
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
          AutoRoute(path: "", page: add.AddScreen),
        ],
      ),
      AutoRoute(
          path: 'profile',
          name: 'profileRouter',
          page: ProfileScreen,
          children: [AutoRoute(path: "welcome", page: welcome.WelcomeScreen)]),
    ], guards: [
      AuthGuard
    ]),
    AutoRoute(
        path: "welcome", name: "welcomeRouter", page: welcome.WelcomeScreen),
    AutoRoute(path: "register", name: "registerRouter", page: RegisterScreen),
    AutoRoute(path: "login", name: "loginRouter", page: LoginScreen),
  ],
)
class $AppRouter {}

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    var box = await Hive.openBox('tokenBox');
    var token = box.get('Token');
    if (token != null) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      resolver.next(true);
      router.push(const WelcomeRouter());
    }
  }
}
