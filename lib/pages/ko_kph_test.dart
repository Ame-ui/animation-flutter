import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/utils/painters/gradient_rotate_painter.dart';

class KoKphTest extends StatefulWidget {
  const KoKphTest({super.key});

  @override
  State<KoKphTest> createState() => _KoKphTestState();
}

class _KoKphTestState extends State<KoKphTest> with TickerProviderStateMixin {
  late AnimationController dxAnimationController;
  late AnimationController dyAnimationController;

  @override
  void initState() {
    super.initState();
    dxAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          dyAnimationController.value = 0;
          dyAnimationController.forward();
        } else if (status == AnimationStatus.dismissed) {
          dyAnimationController.reverse();
        }
      });
    dyAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((value) {
        if (value == AnimationStatus.completed) {
          dxAnimationController.reverse();
        } else if (value == AnimationStatus.dismissed) {
          dxAnimationController.value = 0;
          dxAnimationController.forward();
        }
      });
  }

  @override
  void dispose() {
    dxAnimationController.dispose();
    dyAnimationController.dispose();
    ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.width,
          child: AnimatedBuilder(
              animation: dyAnimationController,
              builder: (context, child) {
                return AnimatedBuilder(
                    animation: dxAnimationController,
                    builder: (context, child) {
                      return Center(
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: CustomPaint(
                                size: Size.fromWidth(Get.width / 2),
                                painter: GradientRotatePainter(
                                    offset1: Offset(
                                        200 * dxAnimationController.value,
                                        200 * dyAnimationController.value),
                                    offset2: Offset(
                                        200 -
                                            (200 * dxAnimationController.value),
                                        200 -
                                            (200 *
                                                dyAnimationController.value))),
                              ),
                            ),
                            // Transform.translate(
                            //   offset: Offset(
                            //       190 * widthAnimationController.value,
                            //       190 * heightAnimationController.value),
                            //   child: Container(
                            //     width: 15,
                            //     height: 15,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Colors.amber,
                            //     ),
                            //   ),
                            // ),
                            // Transform.translate(
                            //   offset: Offset(
                            //       190 - (190 * widthAnimationController.value),
                            //       190 -
                            //           (190 * heightAnimationController.value)),
                            //   child: Container(
                            //     width: 15,
                            //     height: 15,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Colors.amber,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
