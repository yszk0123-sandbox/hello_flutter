import 'package:flutter/material.dart';
import '../pages/basic_layout/basic_layout_page.dart';
import '../pages/chat/chat_page.dart';
import '../pages/home/home_page.dart';
import '../pages/random_words/random_words_page.dart';

class RoutingPath {
  static const home = '/';
  static const basicLayout = '/basicLayout';
  static const chat = '/chat';
  static const randomWords = '/randomWords';
}

class _Route {
  final String path;
  final WidgetBuilder builder;
  final String title;
  _Route({@required this.path, @required this.builder, @required this.title});
}

const String initialRoute = RoutingPath.home;

final List<_Route> routesList = [
  _Route(
      title: 'Home',
      path: RoutingPath.home,
      builder: (BuildContext context) => HomePage()),
  _Route(
      path: RoutingPath.basicLayout,
      title: 'Basic Layout',
      builder: (BuildContext context) => BasicLayoutPage()),
  _Route(
      path: RoutingPath.chat,
      title: 'Chat',
      builder: (BuildContext context) => ChatPage()),
  _Route(
      path: RoutingPath.randomWords,
      title: 'Random Words',
      builder: (BuildContext context) => RandomWordsPage()),
];

Map<String, WidgetBuilder> routesMap = Map.fromEntries(
    routesList.map((_Route route) => MapEntry(route.path, route.builder)));
