import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/utils/painters/rotate.dart';

class RotateAnimation extends StatefulWidget {
  const RotateAnimation({super.key, required this.color, required this.start});
  final Color color;
  final double start;

  @override
  State<RotateAnimation> createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000))
      ..forward(from: widget.start)
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return SizedBox(
            width: Get.width * 0.37,
            height: Get.width * 0.37,
            child: Opacity(
              opacity: animationController.value,
              child: Transform.scale(
                scale: animationController.value,
                child: CustomPaint(
                  size: Size.fromRadius(Get.width * 4),
                  painter: RotatePainter(
                      color: widget.color,
                      degree: 360 * animationController.value),
                ),
              ),
            ),
          );
        });
  }
}
