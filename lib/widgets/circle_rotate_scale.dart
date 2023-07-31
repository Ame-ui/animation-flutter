import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleRotateScale extends StatefulWidget {
  const CircleRotateScale(
      {super.key, required this.start, required this.color});
  final double start;
  final Color color;

  @override
  State<CircleRotateScale> createState() => _CircleRotateScaleState();
}

class _CircleRotateScaleState extends State<CircleRotateScale>
    with TickerProviderStateMixin {
  late AnimationController firstAanimationController;
  late AnimationController scaleAnimationController;
  // late AnimationController secondAanimationController;
  // late AnimationController thirdAanimationController;
  late Animation<double> firstAnimation;
  int xReverse = 0;
  // late Animation<double> secondAnimation;
  // late Animation<double> thirdAnimation;
  @override
  void initState() {
    super.initState();
    // first
    firstAanimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward(from: widget.start)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstAanimationController.value = 1;
          firstAanimationController.reverse();
          scaleAnimationController.value = 1;
          scaleAnimationController.reverse();
          xReverse = 1;
        } else if (status == AnimationStatus.dismissed) {
          if (xReverse == 1) {
            firstAanimationController.value = 1;
            firstAanimationController.reverse();
            scaleAnimationController.value = 0;
            scaleAnimationController.forward();
            xReverse = 2;
          } else {
            firstAanimationController.value = 0;
            firstAanimationController.forward();
            xReverse = 0;
          }
        }
      });
    firstAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: firstAanimationController, curve: Curves.ease));
    scaleAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        lowerBound: 0.5,
        upperBound: 1);
    // // second
    // secondAanimationController = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 1000))
    //   ..addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       thirdAanimationController.value = 0;
    //       thirdAanimationController.forward();
    //     }
    //   });
    // secondAnimation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
    //     parent: secondAanimationController, curve: Curves.decelerate));
    // //third

    // thirdAanimationController = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 1000))
    //   ..addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       firstAanimationController.value = 0;
    //       firstAanimationController.forward();
    //     }
    //   });
    // thirdAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
    //     parent: thirdAanimationController, curve: Curves.decelerate));

    // switch (widget.start) {
    //   case 'first':
    //     firstAanimationController.forward();
    //     break;
    //   case 'second':
    //     secondAanimationController.forward();
    //     break;
    //   case 'third':
    //     thirdAanimationController.forward();
    //     break;
    // }
  }

  @override
  void dispose() {
    firstAanimationController.dispose();
    scaleAnimationController.dispose();
    // secondAanimationController.dispose();
    // thirdAanimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedBuilder(
          animation: firstAanimationController,
          builder: (context, child) {
            var aOffset = Offset(((Get.width * 0.2) * firstAnimation.value), 0);
            if (xReverse != 0) {
              if (xReverse == 1) {
                aOffset = Offset(
                    (Get.width * 0.2 * firstAnimation.value / 2) +
                        Get.width * 0.1,
                    0);
              } else {
                aOffset =
                    Offset(((Get.width * 0.2) * firstAnimation.value / 2), 0);
              }
            }
            return Stack(
              children: [
                AnimatedBuilder(
                    animation: scaleAnimationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: scaleAnimationController.value,
                        child: Transform.translate(
                          offset: aOffset,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: widget.color,
                          ),
                        ),
                      );
                    })
              ],
            );
          }),
    );
  }
}
