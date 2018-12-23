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

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
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
                  child: IconButton(
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
    ChatMessage message = ChatMessage(
        text: text,
        animationController: AnimationController(
            duration: Duration(milliseconds: 200), vsync: this));

    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  ChatMessage({this.text, this.animationController});

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
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_name, style: Theme.of(context).textTheme.subhead),
                        Container(
                            margin: EdgeInsets.only(top: 5), child: Text(text))
                      ])
                ])));
  }
}
