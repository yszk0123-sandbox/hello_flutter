import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData _iosTheme = ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Colors.grey[100],
      primaryColorBrightness: Brightness.light);

  final ThemeData _defaultTheme = ThemeData(
      primarySwatch: Colors.green, accentColor: Colors.orangeAccent[400]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: defaultTargetPlatform == TargetPlatform.iOS
            ? _iosTheme
            : _defaultTheme,
        home: HomePage());
  }
}
