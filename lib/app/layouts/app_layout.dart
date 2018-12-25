import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final String title;
  final Widget child;
  final FloatingActionButton floatingActionButton;

  AppLayout({this.title, this.child, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 4,
      ),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
