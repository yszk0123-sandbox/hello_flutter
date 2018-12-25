import 'package:flutter/material.dart';
import '../../app/layouts/app_layout.dart';

class BasicLayoutPage extends StatelessWidget {
  final TextStyle _style = TextStyle(
    color: Colors.orange[300],
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );
  final BoxDecoration _gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0, -1),
      end: Alignment(0, 0.6),
      colors: <Color>[Colors.blue[500], Colors.blue[700]],
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    boxShadow: <BoxShadow>[
      BoxShadow(color: Colors.black, offset: Offset(0, 2), blurRadius: 4),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return AppLayout(title: 'Basic Layout', child: _buildSample());
  }

  Widget _buildSample() {
    final Widget sampleBox = Container(
      child: Text('Sample', style: _style, textAlign: TextAlign.end),
      width: 240,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.red[400]),
    );
    final Widget sampleBox2 = Positioned(
      child: Transform(
        child: Container(
          child: Text('Sample2', style: _style),
          width: 240,
          padding: EdgeInsets.all(16),
          decoration: _gradientDecoration,
        ),
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..scale(0.8)
          ..rotateZ(15 * 3.1415927 / 180),
      ),
      left: 24,
      top: 24,
    );
    final Widget sampleBox3 = Positioned(
      child: Container(
        child: Text('Sample', style: _style, textAlign: TextAlign.end),
        width: 240,
        height: 48,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.red[400]),
      ),
      left: 8,
      top: 48,
    );

    return Center(
      child: Container(
        child: Center(
          child: Stack(children: [sampleBox, sampleBox2, sampleBox3]),
        ),
        width: 320,
        height: 480,
        color: Colors.grey[300],
      ),
    );
  }
}
