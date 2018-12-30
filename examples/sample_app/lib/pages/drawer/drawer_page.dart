import 'package:flutter/material.dart';
import '../../app/layouts/app_layout.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Drawer',
      child: const Center(child: Text('Drawer')),
      drawer: Drawer(child: DrawerContent()),
    );
  }
}

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        const ListTile(
          title: Text('Item 1'),
        ),
        const ListTile(
          title: Text('Item 2'),
        ),
        ListTile(
          title: const Text('Close Drawer'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
