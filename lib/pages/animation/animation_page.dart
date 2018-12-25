import 'package:flutter/material.dart';
import '../../app/layouts/app_layout.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(title: 'Basic Layout', child: _buildContent());
  }

  Widget _buildContent() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.green,
    );
  }
}
