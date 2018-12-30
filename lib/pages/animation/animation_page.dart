import 'package:flutter/material.dart';
import '../../app/layouts/app_layout.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Basic Layout',
      child: Center(
        child: Container(
            child: _AnimationBox(
          visible: _visible,
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}

class _AnimationBox extends StatelessWidget {
  const _AnimationBox({@required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: Duration(milliseconds: 500),
      child: Container(
        width: 200,
        height: 200,
        color: Colors.green,
      ),
    );
  }
}
