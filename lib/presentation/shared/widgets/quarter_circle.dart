
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

enum CircleAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  bottom
}


class QuarterCirclePainter extends CustomPainter {
  final CircleAlignment circleAlignment;
  final Color color;

  const QuarterCirclePainter(this.circleAlignment, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.height;
    // final radius = min(size.height, size.width);
    final offset = circleAlignment == CircleAlignment.topLeft
        ? Offset(.0, .0)
        : circleAlignment == CircleAlignment.topRight
            ? Offset(size.width, .0)
            : circleAlignment == CircleAlignment.bottomLeft
                ? Offset(.0, size.height)
                : Offset(size.width, size.height);
    // canvas.drawArc(Rect.fromCenter(center: Offset(size.height, size.width*0.7), width: size.width, height: size.height), math.pi, math.pi, false, Paint()..color = color);
    canvas.drawCircle(offset, radius, Paint()..color = color);
  }

  @override
  bool shouldRepaint(QuarterCirclePainter oldDelegate) {
    return color == oldDelegate.color &&
        circleAlignment == oldDelegate.circleAlignment;
  }
}