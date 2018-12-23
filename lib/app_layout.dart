import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final String title;
  final Widget child;

  AppLayout({this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child);
  }
}
