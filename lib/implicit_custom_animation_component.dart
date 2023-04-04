import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitCustomAnimationComponent extends StatefulWidget {
  @override
  _ImplicitCustomAnimationComponentState createState() => _ImplicitCustomAnimationComponentState();
}

class _ImplicitCustomAnimationComponentState extends State<ImplicitCustomAnimationComponent> {
  final tween = Tween<double>(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Implicit animations')),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _buildSimpleDialogButton(context),
            _buildSizingSpinningDialogButton(context),
          ]),
        ),
      );

  Widget _buildSimpleDialogButton(BuildContext context) => OutlinedButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Hello!'),
            content: Text('Just a boring old dialog, thats all...'),
            actions: [
              OutlinedButton(
                child: Text('Close'),
                onPressed: () => Navigator.of(context).maybePop(false),
              ),
            ],
          ),
        ),
        child: Text('Press me!'),
      );

  Widget _buildSizingSpinningDialogButton(BuildContext context) => OutlinedButton(
        onPressed: () => _showSpinningDialog(context),
        child: Text('Press me to go wild!'),
      );

  Future<void> _showSpinningDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => TweenAnimationBuilder(
          duration: Duration(milliseconds: 750),
          tween: tween,
          curve: Curves.easeIn,
          builder: (_, double animationValue, __) => Transform.rotate(
            angle: animationValue * 2 * pi,
            child: Transform.scale(
              scale: animationValue,
              child: AlertDialog(
                title: Text('Hello! How are you today?'),
                content: Text('Spinning and sizing is amazing is it not?'),
                actions: [
                  OutlinedButton(
                    child: Text('Close'),
                    onPressed: () => Navigator.of(context).maybePop(false),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
