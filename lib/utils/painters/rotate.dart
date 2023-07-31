import 'dart:math';

import 'package:flutter/material.dart';

class RotatePainter extends CustomPainter {
  Color color;
  double degree;
  double circleRadius;
  double? radius;

  RotatePainter(
      {required this.color,
      required this.degree,
      this.circleRadius = 10,
      this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    radius ??= size.width / 4;
    Paint paint = Paint()..color = color;
    var center = Offset(size.width / 2, size.height / 2);
    var location = center +
        Offset(cos(degreeToRadian(degree)) * radius!.toDouble(),
            sin(degreeToRadian(degree)) * radius!.toDouble());
    canvas.drawCircle(location, circleRadius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }
}
