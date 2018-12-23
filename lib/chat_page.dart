import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        body: _buildSample());
  }

  Widget _buildSample() {
    return Center(
        child: Container(
            child: Center(child: Container(child: Text('Sample'))),
            width: 320,
            height: 480,
            color: Colors.grey[300]));
  }
}
