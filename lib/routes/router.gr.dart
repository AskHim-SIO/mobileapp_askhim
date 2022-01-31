// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i12;

import '../components/appbar.dart' as _i1;
import '../Screens/Add/add_screen.dart' as _i10;
import '../Screens/Categorie/categorie_screens.dart' as _i8;
import '../Screens/Chat/chat_screen.dart' as _i11;
import '../Screens/Home/home_screen.dart' as _i7;
import '../Screens/Login/login_screen.dart' as _i4;
import '../Screens/Profile/profile_screen.dart' as _i6;
import '../Screens/Register/register_screen.dart' as _i3;
import '../Screens/Search/search_screen.dart' as _i9;
import '../Screens/Welcome/welcome_screens.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AppBar.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.appBar());
    },
    WelcomeRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.WelcomeScreen());
    },
    RegisterRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RegisterScreen());
    },
    LoginRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.LoginScreen());
    },
    HomeRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    AddRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    MessageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    ProfileRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ProfileScreen());
    },
    HomeScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomeScreen());
    },
    CategorieRoute.name: (routeData) {
      final args = routeData.argsAs<CategorieRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.CategoriePage(key: args.key, id: args.id, nom: args.nom));
    },
    SearchScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SearchScreen());
    },
    AddScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.AddScreen());
    },
    ChatScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ChatScreen());
    },
    WelcomeScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.WelcomeScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(AppBar.name, path: '/', children: [
          _i5.RouteConfig(WelcomeRouter.name,
              path: 'welcome', parent: AppBar.name),
          _i5.RouteConfig(RegisterRouter.name,
              path: 'register', parent: AppBar.name),
          _i5.RouteConfig(LoginRouter.name, path: 'login', parent: AppBar.name),
          _i5.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: AppBar.name,
              children: [
                _i5.RouteConfig(HomeScreen.name,
                    path: '', parent: HomeRouter.name),
                _i5.RouteConfig(CategorieRoute.name,
                    path: ':categorieId', parent: HomeRouter.name)
              ]),
          _i5.RouteConfig(SearchRouter.name,
              path: 'search',
              parent: AppBar.name,
              children: [
                _i5.RouteConfig(SearchScreen.name,
                    path: '', parent: SearchRouter.name),
                _i5.RouteConfig(CategorieRoute.name,
                    path: ':categorieId', parent: SearchRouter.name)
              ]),
          _i5.RouteConfig(AddRouter.name,
              path: 'add',
              parent: AppBar.name,
              children: [
                _i5.RouteConfig(AddScreen.name,
                    path: '', parent: AddRouter.name)
              ]),
          _i5.RouteConfig(MessageRouter.name,
              path: 'message',
              parent: AppBar.name,
              children: [
                _i5.RouteConfig(ChatScreen.name,
                    path: '', parent: MessageRouter.name)
              ]),
          _i5.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: AppBar.name,
              children: [
                _i5.RouteConfig(WelcomeScreen.name,
                    path: 'welcome', parent: ProfileRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.appBar]
class AppBar extends _i5.PageRouteInfo<void> {
  const AppBar({List<_i5.PageRouteInfo>? children})
      : super(AppBar.name, path: '/', initialChildren: children);

  static const String name = 'AppBar';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomeRouter extends _i5.PageRouteInfo<void> {
  const WelcomeRouter() : super(WelcomeRouter.name, path: 'welcome');

  static const String name = 'WelcomeRouter';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRouter extends _i5.PageRouteInfo<void> {
  const RegisterRouter() : super(RegisterRouter.name, path: 'register');

  static const String name = 'RegisterRouter';
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRouter extends _i5.PageRouteInfo<void> {
  const LoginRouter() : super(LoginRouter.name, path: 'login');

  static const String name = 'LoginRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeRouter extends _i5.PageRouteInfo<void> {
  const HomeRouter({List<_i5.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class SearchRouter extends _i5.PageRouteInfo<void> {
  const SearchRouter({List<_i5.PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'search', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class AddRouter extends _i5.PageRouteInfo<void> {
  const AddRouter({List<_i5.PageRouteInfo>? children})
      : super(AddRouter.name, path: 'add', initialChildren: children);

  static const String name = 'AddRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class MessageRouter extends _i5.PageRouteInfo<void> {
  const MessageRouter({List<_i5.PageRouteInfo>? children})
      : super(MessageRouter.name, path: 'message', initialChildren: children);

  static const String name = 'MessageRouter';
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRouter extends _i5.PageRouteInfo<void> {
  const ProfileRouter({List<_i5.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i7.HomeScreen]
class HomeScreen extends _i5.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i8.CategoriePage]
class CategorieRoute extends _i5.PageRouteInfo<CategorieRouteArgs> {
  CategorieRoute({_i12.Key? key, required int id, required String nom})
      : super(CategorieRoute.name,
            path: ':categorieId',
            args: CategorieRouteArgs(key: key, id: id, nom: nom),
            rawPathParams: {'id': id});

  static const String name = 'CategorieRoute';
}

class CategorieRouteArgs {
  const CategorieRouteArgs({this.key, required this.id, required this.nom});

  final _i12.Key? key;

  final int id;

  final String nom;

  @override
  String toString() {
    return 'CategorieRouteArgs{key: $key, id: $id, nom: $nom}';
  }
}

/// generated route for
/// [_i9.SearchScreen]
class SearchScreen extends _i5.PageRouteInfo<void> {
  const SearchScreen() : super(SearchScreen.name, path: '');

  static const String name = 'SearchScreen';
}

/// generated route for
/// [_i10.AddScreen]
class AddScreen extends _i5.PageRouteInfo<void> {
  const AddScreen() : super(AddScreen.name, path: '');

  static const String name = 'AddScreen';
}

/// generated route for
/// [_i11.ChatScreen]
class ChatScreen extends _i5.PageRouteInfo<void> {
  const ChatScreen() : super(ChatScreen.name, path: '');

  static const String name = 'ChatScreen';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomeScreen extends _i5.PageRouteInfo<void> {
  const WelcomeScreen() : super(WelcomeScreen.name, path: 'welcome');

  static const String name = 'WelcomeScreen';
}
