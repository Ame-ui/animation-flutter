import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class LoadingCircle extends CustomPainter {
  double startAngle;
  double sweepAngle;

  LoadingCircle({required this.startAngle, required this.sweepAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint blurPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..blendMode = BlendMode.lighten
      ..shader = ui.Gradient.linear(
        Offset(size.width, 0),
        Offset(0, size.height),
        [
          const ui.Color.fromARGB(255, 93, 0, 255),
          const ui.Color.fromARGB(255, 255, 17, 0)
        ],
        [0.4, 0.5],
      )
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..shader = ui.Gradient.linear(
          Offset(size.width, 0),
          Offset(0, size.height),
          [Colors.deepPurple, Colors.red],
          [0.3, 0.5],
          TileMode.decal);
    Rect rect1 = Rect.fromCircle(center: center, radius: size.width / 2);
    // Rect rect2 = Rect.fromCircle(center: center, radius: size.width * 0.2 + 5);
    // Rect rect3 = Rect.fromCircle(center: center, radius: size.width * 0.2 + 10);

    canvas.drawArc(rect1, degreeToRadian(startAngle),
        degreeToRadian(sweepAngle), false, blurPaint);
    canvas.drawArc(rect1, degreeToRadian(startAngle),
        degreeToRadian(sweepAngle), false, paint);
    // canvas.drawArc(rect2, degreeToRadian(0), degreeToRadian(360), false, paint);
    // canvas.drawArc(rect3, degreeToRadian(0), degreeToRadian(360), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }
}
