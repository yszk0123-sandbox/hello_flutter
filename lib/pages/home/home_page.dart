import 'package:flutter/material.dart';
import '../../app/layouts/app_layout.dart';
import '../../app/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = routesList.map((route) {
      return ListTile(
        title: Text(route.title),
        onTap: () {
          Navigator.pushNamed(context, route.path);
        },
      );
    }).toList();

    return AppLayout(title: 'Home', child: ListView(children: list));
  }
}
