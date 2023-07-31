import 'dart:math';

import 'package:flutter/material.dart';

class GymAnimation extends StatefulWidget {
  const GymAnimation({super.key});

  @override
  State<GymAnimation> createState() => _GymAnimationState();
}

class _GymAnimationState extends State<GymAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..repeat();
    animation = Tween<double>(begin: 0, end: 180).animate(
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut));
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
          return Transform.rotate(
            angle: animation.value * pi / 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                weight(3, 5),
                weight(8, 20),
                weight(10, 5),
                weight(8, 20),
                weight(3, 5),
              ],
            ),
          );
        });
  }

  Widget weight(double width, double height) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
    );
  }
}
