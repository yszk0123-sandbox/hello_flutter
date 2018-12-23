import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../app/layouts/app_layout.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(title: 'Chat', child: _ChatScreen());
  }
}

class _ChatScreen extends StatefulWidget {
  @override
  State createState() => _ChatScreenState();
}

class _ChatScreenState extends State<_ChatScreen>
    with TickerProviderStateMixin {
  final List<_ChatMessage> _messages = <_ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
            padding: EdgeInsets.all(8),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          )),
          Divider(height: 1),
          Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer())
        ],
      ),
      decoration: Theme.of(context).platform == TargetPlatform.iOS
          ? BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[200])))
          : null,
    );
  }

  @override
  void dispose() {
    for (_ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
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
                      onChanged: _handleTextChanged,
                      onSubmitted: _handleSubmitted,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Send a message'))),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? CupertinoButton(
                          child: Text('Send'),
                          onPressed: _isComposing
                              ? () => _handleSubmitted(_textController.text)
                              : null,
                        )
                      : IconButton(
                          icon: Icon(Icons.send),
                          onPressed: _isComposing
                              ? () => _handleSubmitted(_textController.text)
                              : null,
                        ))
            ])));
  }

  void _handleTextChanged(String text) {
    setState(() {
      _isComposing = text.length > 0;
    });
  }

  void _handleSubmitted(String text) {
    _clearText();
    _sendMessage(text);
  }

  void _clearText() {
    _textController.clear();

    setState(() {
      _isComposing = false;
    });
  }

  void _sendMessage(String text) {
    _ChatMessage message = _ChatMessage(
        text: text,
        animationController: AnimationController(
            duration: Duration(milliseconds: 200), vsync: this));

    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
}

class _ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  _ChatMessage({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    const String _name = 'Your Name';

    return SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: CircleAvatar(child: Text(_name[0])),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(_name,
                              style: Theme.of(context).textTheme.subhead),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(text))
                        ]),
                  )
                ])));
  }
}
