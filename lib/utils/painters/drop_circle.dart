import 'dart:math';

import 'package:flutter/material.dart';

class DropCirclePainter extends CustomPainter {
  Color color;
  double startAngle;
  double sweepAngle;

  DropCirclePainter(
      {required this.color,
      required this.startAngle,
      required this.sweepAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..color = color;
//
    var center = Offset(size.width / 2, size.height / 2);

    Rect rect = Rect.fromCircle(center: center, radius: (size.width / 2) - 5);

    canvas.drawArc(rect, degreeToRadian(startAngle), degreeToRadian(sweepAngle),
        false, paint);
  }

  @override
  bool shouldRepaint(DropCirclePainter oldDelegate) => true;

  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }
}
