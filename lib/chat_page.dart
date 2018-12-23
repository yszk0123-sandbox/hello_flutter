import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        body: ChatScreen());
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildTextComposer();
  }

  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(children: <Widget>[
              Flexible(
                  child: TextField(
                      controller: _textController,
                      onSubmitted: _handleSubmitted,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Send a message'))),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text),
                  ))
            ])));
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}
