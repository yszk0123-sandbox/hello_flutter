import 'package:flutter/material.dart';
import 'random_words.dart';
import 'basic_layout.dart';
import 'chat_page.dart';
import 'app_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
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
              return RandomWords();
            }));
          }),
      ListTile(
          title: Text('Basic Layout'),
          onTap: () {
            return Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return BasicLayout();
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
