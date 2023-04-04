import 'package:flutter/material.dart';

class ExplicitCustomAnimationComponent extends StatefulWidget {
  @override
  _ExplicitCustomAnimationComponentState createState() => _ExplicitCustomAnimationComponentState();
}

class _ExplicitCustomAnimationComponentState extends State<ExplicitCustomAnimationComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _heightAnimation;

  void initState() {
    super.initState();

    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this);

    _heightAnimation = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Explicit custom animations')),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, mainAxisSize: MainAxisSize.max, children: [
          _buildCircle(),

          AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) => SizedBox(
              height: _heightAnimation.value,
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
