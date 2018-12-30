import 'package:flutter/material.dart';
import '../pages/animation/animation_page.dart';
import '../pages/basic_layout/basic_layout_page.dart';
import '../pages/chat/chat_page.dart';
import '../pages/drawer/drawer_page.dart';
import '../pages/home/home_page.dart';
import '../pages/random_words/random_words_page.dart';

class RoutingPath {
  static const home = '/';
  static const animation = '/animation';
  static const basicLayout = '/basicLayout';
  static const chat = '/chat';
  static const drawer = '/drawer';
  static const randomWords = '/randomWords';
}

class AppRoute {
  AppRoute({@required this.path, @required this.builder, @required this.title});

  final String path;
  final WidgetBuilder builder;
  final String title;
}

const String initialRoute = RoutingPath.home;

final List<AppRoute> routesList = <AppRoute>[
  AppRoute(
    title: 'Home',
    path: RoutingPath.home,
    builder: (BuildContext context) => HomePage(),
  ),
  AppRoute(
    path: RoutingPath.animation,
    title: 'Animation',
    builder: (BuildContext context) => AnimationPage(),
  ),
  AppRoute(
    path: RoutingPath.basicLayout,
    title: 'Basic Layout',
    builder: (BuildContext context) => BasicLayoutPage(),
  ),
  AppRoute(
    path: RoutingPath.chat,
    title: 'Chat',
    builder: (BuildContext context) => ChatPage(),
  ),
  AppRoute(
    path: RoutingPath.drawer,
    title: 'Drawer',
    builder: (BuildContext context) => DrawerPage(),
  ),
  AppRoute(
    path: RoutingPath.randomWords,
    title: 'Random Words',
    builder: (BuildContext context) => RandomWordsPage(),
  ),
];

Map<String, WidgetBuilder> routesMap = Map.fromEntries(
  routesList.map(
    (AppRoute route) => MapEntry(route.path, route.builder),
  ),
);
