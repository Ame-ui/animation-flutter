import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/utils/painters/loading_circle.dart';

class FinalGoal extends StatefulWidget {
  const FinalGoal({super.key});

  @override
  State<FinalGoal> createState() => _FinalGoalState();
}

class _FinalGoalState extends State<FinalGoal> with TickerProviderStateMixin {
  late AnimationController numberController;
  int animationCount = 0;
  int startAngle1 = 0;
  int startAngle2 = 0;
  int startAngle3 = 0;

  //inner
  late AnimationController circle1;
  late AnimationController circle2; //mid
  // late AnimationController circle3; //outer
  @override
  void initState() {
    super.initState();
    numberController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 6),
        lowerBound: 0,
        upperBound: 100)
      ..repeat();

    circle1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              print(status);
              animationCount += 1;
              if (animationCount >= 6) {
                numberController.value = 100;
                numberController.stop();
                circle1.stop();
                circle2.stop();
              } else {
                // setState(() {
                //   //circle 1
                //   startAngle1 += 60;
                //   if (startAngle1 >= 360) {
                //     startAngle1 = 0;
                //   }
                //   // circle 2
                //   startAngle2 += 90;
                //   if (startAngle2 >= 360) {
                //     startAngle2 = 0;
                //   }
                //   //circle 3
                //   startAngle3 += 120;
                //   if (startAngle3 >= 360) {
                //     startAngle3 = 0;
                //   }
                // });
                circle1.reset();
                circle1.forward();
              }
            }
          })
          ..forward();
    circle2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 6))
          ..repeat();
  }

  @override
  void dispose() {
    numberController.dispose();
    circle1.dispose();
    circle2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SizedBox(
        width: Get.width,
        height: Get.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
                animation: circle2,
                builder: (context, child) {
                  return AnimatedBuilder(
                      animation: circle1,
                      builder: (context, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              size: Size(Get.width * 0.4, Get.width * 0.4),
                              painter: LoadingCircle(
                                  startAngle: (circle2.value * 360) * 2,
                                  sweepAngle: circle1.value * 360),
                            ),
                            CustomPaint(
                              size: Size(
                                  Get.width * 0.4 + 12, Get.width * 0.4 + 12),
                              painter: LoadingCircle(
                                  startAngle: (circle2.value * 360) * 4,
                                  sweepAngle: circle1.value * 360),
                            ),
                            CustomPaint(
                              size: Size(
                                  Get.width * 0.4 + 24, Get.width * 0.4 + 24),
                              painter: LoadingCircle(
                                  startAngle: (circle2.value * 360) * 8,
                                  sweepAngle: circle1.value * 360),
                            ),
                          ],
                        );
                      });
                }),
            GestureDetector(
              onTap: () {
                animationCount = 0;
                numberController.reset();
                numberController.forward();
                circle1.reset();
                circle1.forward();
                circle2.reset();
                circle2.repeat();
              },
              child: AnimatedBuilder(
                  animation: numberController,
                  builder: (context, child) {
                    return Text(
                      numberController.value.round().toString(),
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
