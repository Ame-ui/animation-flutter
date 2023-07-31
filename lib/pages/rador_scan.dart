import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/utils/painters/rador_scanner.dart';

class RadorScanPage extends StatefulWidget {
  const RadorScanPage({super.key});

  @override
  State<RadorScanPage> createState() => _RadorScanPageState();
}

class _RadorScanPageState extends State<RadorScanPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
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
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: Get.width * 0.9,
                height: Get.width * 0.9,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      Colors.green.shade900.withOpacity(0.1),
                      Colors.green.shade900.withOpacity(0.7)
                    ])),
              ),
              Container(
                width: 5,
                height: 5,
              ),
              radorField(Get.width * 0.9),
              radorField(Get.width * 0.7),
              radorField(Get.width * 0.5),
              radorField(Get.width * 0.3),
              AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return CustomPaint(
                      size: Size(Get.width * 0.9, Get.width * 0.9),
                      painter: RadorScanner(
                          startAngle: animationController.value * 360),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget radorField(double width) {
    return Container(
      height: width,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade700, width: 3),
          shape: BoxShape.circle),
    );
  }
}
