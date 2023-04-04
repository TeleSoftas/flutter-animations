import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimationComponent extends StatefulWidget {
  @override
  _ImplicitAnimationComponentState createState() => _ImplicitAnimationComponentState();
}

class _ImplicitAnimationComponentState extends State<ImplicitAnimationComponent> {
  double imageHeight = 200;
  double imageWidth = 200;
  Color imageBackgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Implicit animations')),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: 32),
            _buildAnimatedImage(),
            SizedBox(height: 32),
            _buildRandomiseButton(),
            SizedBox(height: 32),
            Flexible(
              child: AnimatedButton(),
            ),
          ]),
        ),
      );

  Widget _buildAnimatedImage() => AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.bounceIn,
        decoration: BoxDecoration(
          color: imageBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        height: imageHeight,
        width: imageWidth,
        child: Image.asset(
          'images/simple_image.png',
          fit: BoxFit.fill,
        ),
      );

  Widget _buildRandomiseButton() => OutlinedButton(
        onPressed: () => setState(() {
          final random = Random();
          imageHeight = doubleInRange(random, 100, 300);
          imageWidth = doubleInRange(random, 100, 300);
          imageBackgroundColor = randomOpaqueColor(random);
        }),
        child: Text('Randomise!'),
      );

  double doubleInRange(Random source, num start, num end) => source.nextDouble() * (end - start) + start;

  Color randomOpaqueColor(Random source) => Color(source.nextInt(0xffffffff)).withAlpha(0xff);
}

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

enum ButtonState { initial, progress, success }

class _AnimatedButtonState extends State<AnimatedButton> {
  ButtonState buttonState = ButtonState.initial;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          color: _getButtonColor(),
          borderRadius: BorderRadius.all(Radius.circular(_getBorderRadius())),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _startButtonAnimation,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 150),
                  child: _getIcon(),
                ),
                if (_getButtonText().isNotEmpty) ...[
                  SizedBox(width: 8),
                  Text(
                    _getButtonText(),
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(width: 8),
                ]
              ]),
            ),
          ),
        ),
      );

  void _startButtonAnimation() {
    setState(() => buttonState = ButtonState.progress);
    Future.delayed(Duration(seconds: 2), () => setState(() => buttonState = ButtonState.success));
  }

  Widget _getIcon() {
    if (buttonState == ButtonState.success) {
      return Icon(
        Icons.check,
        color: Colors.white,
        size: 36,
      );
    }
    if (buttonState == ButtonState.initial) {
      return Icon(
        Icons.add,
        color: Colors.white,
        size: 36,
      );
    }
    return CircularProgressIndicator(color: Colors.white);
  }

  String _getButtonText() {
    if (buttonState == ButtonState.success) {
      return 'Success!';
    }
    if (buttonState == ButtonState.initial) {
      return 'Click me!';
    }
    return '';
  }

  MaterialColor _getButtonColor() {
    if (buttonState == ButtonState.success) {
      return Colors.green;
    }
    if (buttonState == ButtonState.progress) {
      return Colors.yellow;
    }
    return Colors.blue;
  }

  double _getBorderRadius() {
    if (buttonState == ButtonState.initial) {
      return 4;
    }
    return 40;
  }
}
