import 'package:flutter/material.dart';

class ExplicitAnimationComponent extends StatefulWidget {
  @override
  _ExplicitAnimationComponentState createState() => _ExplicitAnimationComponentState();
}

class _ExplicitAnimationComponentState extends State<ExplicitAnimationComponent> //
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Explicit animations')),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, mainAxisSize: MainAxisSize.max, children: [
          _buildCircle(),
          SizeTransition(
            sizeFactor: _animationController,
            child: SizedBox(
              height: 200,
            ),
          ),
          _buildGround(),
        ]),
      );

  Widget _buildGround() => Container(
        color: Colors.blueGrey,
        height: 200,
        width: double.infinity,
      );

  Widget _buildCircle() => Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueAccent,
        ),
      );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
