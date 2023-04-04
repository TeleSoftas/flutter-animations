import 'package:flutter/material.dart';

class CustomPainterAnimationsComponent extends StatefulWidget {
  @override
  _CustomPainterAnimationsComponentState createState() => _CustomPainterAnimationsComponentState();
}

class _CustomPainterAnimationsComponentState extends State<CustomPainterAnimationsComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(duration: Duration(seconds: 10), vsync: this);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.forward(from: 0);
      }
    });
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Custom painter animations')),
        body: Center(
          child: SizedBox.fromSize(
            size: Size.infinite,
            child: _buildRippleAnimation(),
          ),
        ),
      );

  Widget _buildRippleAnimation() => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => CustomPaint(
          size: Size.infinite,
          painter: RipplePainter(
            baseRippleSize: _animationController.value,
            color: Colors.blue,
          ),
        ),
      );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class APainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class RipplePainter extends CustomPainter {
  static int get count => 3;

  final CurveTween _curve = CurveTween(curve: Curves.easeOut);
  final Color _color;
  final double _baseRippleSize;

  RipplePainter({
    required Color color,
    required double baseRippleSize,
  })  : _color = color,
        _baseRippleSize = baseRippleSize;

  @override
  void paint(Canvas canvas, Size size) {
    for (var index = 0; index < count; index++) {
      _drawCircle(canvas, size, _computeRippleSize(count, index));
    }
  }

  double _computeRippleSize(int count, int index) => _baseRippleSize > (1 / count) * (count - index)
      ? _baseRippleSize - (1 / count) * (count - index)
      : _baseRippleSize + (1 / count) * index;

  void _drawCircle(Canvas canvas, Size canvasSize, double rippleSize) => canvas.drawCircle(
        Offset(canvasSize.width / 2, canvasSize.height / 2),
        canvasSize.width * _curve.transform(rippleSize),
        Paint()..color = _color.withOpacity((1 - _curve.transform(rippleSize))),
      );

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
