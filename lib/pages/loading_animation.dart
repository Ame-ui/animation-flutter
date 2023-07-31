import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/widgets/loading_animation/animation_11.dart';
import 'package:pie_chart/widgets/loading_animation/animation_12.dart';
import 'package:pie_chart/widgets/loading_animation/animation_21.dart';
import 'package:pie_chart/widgets/loading_animation/animation_22.dart';
import 'package:pie_chart/widgets/loading_animation/animation_31.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedLoading(
                        start: 0,
                        color: Colors.black,
                      ),
                      AnimatedLoading(
                        start: 0.1,
                        color: Color.fromARGB(255, 134, 96, 96),
                      ),
                      AnimatedLoading(
                        start: 0.2,
                        color: Colors.black,
                      ),
                      AnimatedLoading(
                        start: 0.3,
                        color: Colors.black,
                      ),
                      AnimatedLoading(
                        start: 0.4,
                        color: Colors.black,
                      ),
                      AnimatedLoading(
                        start: 0.5,
                        color: Colors.black,
                      ),
                      AnimatedLoading(
                        start: 0.6,
                        color: Colors.black,
                      ),
                      AnimatedLoading(
                        start: 0.7,
                        color: Colors.black,
                      ),
                      AnimatedLoading(
                        start: 0.8,
                        color: Colors.black,
                      ),
                      AnimatedLoading(
                        start: 0.9,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: const [
                      RotateAnimation(
                        color: Colors.black,
                        start: 0,
                      ),
                      RotateAnimation(color: Colors.black, start: 0.20),
                      RotateAnimation(
                        color: Colors.black,
                        start: 0.4,
                      ),
                      RotateAnimation(
                        color: Colors.black,
                        start: 0.6,
                      ),
                      RotateAnimation(
                        color: Colors.black,
                        start: 0.8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const DropCircleAnimation(),
                ),
                Container(
                    width: Get.width * 0.3,
                    height: Get.width * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const GymAnimation())
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const ThreeCircleRotate(),
                ),
                Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
