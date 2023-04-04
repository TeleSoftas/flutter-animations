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
