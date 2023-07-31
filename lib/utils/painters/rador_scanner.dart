import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RadorScanner extends CustomPainter {
  double startAngle;

  RadorScanner({required this.startAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset((cos(degreeToRadian(startAngle + 90)) * (size.width / 2)) + 180,
            (sin(degreeToRadian(startAngle + 90)) * (size.height / 2)) + 180),
        Offset(size.width / 2, size.width / 2),
        [Colors.green, Colors.transparent],
      );
    // Paint paint2 = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 4
    //   ..strokeCap = StrokeCap.round
    //   ..color = Colors.green;

    Rect scanner = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);
    // Rect scanner2 = Rect.fromCircle(
    //     center: Offset(size.width / 2, size.height / 2),
    //     radius: size.width / 2 - 2);
    // canvas.drawArc(scanner2, degreeToRadian(startAngle + 90), degreeToRadian(1),
    //     true, paint2);
    // final c =

    canvas.drawArc(
        scanner, degreeToRadian(startAngle), degreeToRadian(90), true, paint);
    // canvas.drawCircle(c, radius, paint)
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }
}
