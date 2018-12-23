import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app/layouts/app_layout.dart';
import 'pages/basic_layout/basic_layout_page.dart';
import 'pages/chat/chat_page.dart';
import 'pages/random_words/random_words_page.dart';

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
        home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> list = [
      ListTile(
          title: Text('Random Words'),
          onTap: () {
            return Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return RandomWordsPage();
            }));
          }),
      ListTile(
          title: Text('Basic Layout'),
          onTap: () {
            return Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return BasicLayoutPage();
            }));
          }),
      ListTile(
          title: Text('Chart'),
          onTap: () {
            return Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return ChatPage();
            }));
          })
    ];

    return AppLayout(title: 'Examples', child: ListView(children: list));
  }
}
