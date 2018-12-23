import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  final TextStyle _style =
      TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.w900);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Basic Layout'),
        ),
        body: _buildSample());
  }

  Widget _buildSample() {
    return Text('Sample', style: _style);
  }
}
