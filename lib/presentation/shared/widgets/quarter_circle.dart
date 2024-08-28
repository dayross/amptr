import 'dart:math';

import 'package:flutter/material.dart';

enum CircleAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
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
    canvas.drawCircle(offset, radius, Paint()..color = color);
  }

  @override
  bool shouldRepaint(QuarterCirclePainter oldDelegate) {
    return color == oldDelegate.color &&
        circleAlignment == oldDelegate.circleAlignment;
  }
}