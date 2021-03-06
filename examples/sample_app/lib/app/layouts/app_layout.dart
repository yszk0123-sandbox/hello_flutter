import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    this.title,
    this.child,
    this.drawer,
    this.floatingActionButton,
  });

  final String title;
  final Widget child;
  final Drawer drawer;
  final FloatingActionButton floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 4,
      ),
      body: child,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    );
  }
}
