import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GradientRotatePainter extends CustomPainter {
  Offset offset1;
  Offset offset2;
  GradientRotatePainter({required this.offset1, required this.offset2});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    // Offset maxOffset = Offset(size.width, size.height);

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, 20)
      ..shader = ui.Gradient.linear(offset1, offset2, [
        Colors.red,
        // Colors.orange,
        // Colors.yellow,
        Colors.green,
        Colors.blue,
        // Colors.purple
      ], [
        0,
        // 0.1,
        // 0.4,
        0.5,
        // 0.9,
        1
      ]);

    Rect rect = Rect.fromCircle(center: center, radius: size.width / 2);
    RRect rRect = RRect.fromRectAndCorners(rect,
        topLeft: const Radius.circular(10),
        topRight: const Radius.circular(10),
        bottomLeft: const Radius.circular(10),
        bottomRight: const Radius.circular(10));

    canvas.drawRRect(rRect, paint);
    canvas.drawRRect(rRect, paint);
    // canvas.drawCircle(offset1, 10, paint);
  }

  @override
  bool shouldRepaint(GradientRotatePainter oldDelegate) => true;

  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }
}
