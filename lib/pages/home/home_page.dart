import 'package:flutter/material.dart';
import '../../app/layouts/app_layout.dart';
import '../basic_layout/basic_layout_page.dart';
import '../chat/chat_page.dart';
import '../random_words/random_words_page.dart';

class HomePage extends StatelessWidget {
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
