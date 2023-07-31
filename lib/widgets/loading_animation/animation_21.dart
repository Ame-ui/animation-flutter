import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pie_chart/utils/painters/drop_circle.dart';

class DropCircleAnimation extends StatefulWidget {
  const DropCircleAnimation({super.key});

  @override
  State<DropCircleAnimation> createState() => _DropCircleAnimationState();
}

class _DropCircleAnimationState extends State<DropCircleAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController ballAnimationController;
  late Animation<double> ballAnimation;

  @override
  void initState() {
    ballAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..forward()
          ..addStatusListener((value) {
            if (value == AnimationStatus.completed) {
              animationController.value = 0;
              animationController.forward();
            }
          });

    ballAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: ballAnimationController, curve: Curves.easeInBack));

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      // ..repeat()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          ballAnimationController.value = 0;
          ballAnimationController.forward();
          print(ballAnimationController.status);
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    ballAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                width: Get.width * double.infinity,
                height: Get.height * double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 10)),
              ),
              Visibility(
                visible:
                    animationController.status != AnimationStatus.completed,
                child: CustomPaint(
                  size: const Size(double.infinity, double.infinity),
                  painter: DropCirclePainter(
                      color: Colors.black,
                      startAngle: 90,
                      sweepAngle: animationController.value * 180),
                ),
              ),
              Visibility(
                visible:
                    animationController.status != AnimationStatus.completed,
                child: CustomPaint(
                  size: const Size(double.infinity, double.infinity),
                  painter: DropCirclePainter(
                      color: Colors.black,
                      startAngle: 90,
                      sweepAngle: -animationController.value * 180),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: AnimatedBuilder(
                    animation: ballAnimationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset:
                            Offset(0, Get.width * 0.182 * ballAnimation.value),
                        child: const CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.black,
                        ),
                      );
                    }),
              )
            ],
          );
        });
  }
}
