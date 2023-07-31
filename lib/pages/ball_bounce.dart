import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BouncingBallPage extends StatefulWidget {
  const BouncingBallPage({super.key});

  @override
  State<BouncingBallPage> createState() => _BouncingBallPageState();
}

class _BouncingBallPageState extends State<BouncingBallPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animationValue;
  double scrollOffset = 0;
  bool xAnimate = false;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    xAnimate = true;
    animationValue = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn));
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return GestureDetector(
                    onTap: () {
                      if (xAnimate) {
                        animationController.stop();
                        xAnimate = false;
                      } else {
                        if (animationController.status ==
                            AnimationStatus.forward) {
                          animationController.forward();
                        } else if (animationController.status ==
                            AnimationStatus.reverse) {
                          animationController.reverse();
                        }
                        xAnimate = true;
                      }
                      setState(() {});
                    },
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Transform.scale(
                            scale: animationValue.value,
                            child: const CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.black12,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          bottom: 0,
                          child: Transform.translate(
                            offset: Offset(
                                0, -(animationValue.value * (Get.width * 0.3))),
                            child: Transform.scale(
                              scale: animationValue.value + 0.3,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.amber,
                                ),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // color: Colors.orange,
                                    gradient: RadialGradient(
                                        // begin: Alignment.topLeft,
                                        // end: Alignment.bottomRight,

                                        colors: [
                                          // Colors.transparent,
                                          Colors.blueGrey.withOpacity(0.1),
                                          Colors.blueGrey.withOpacity(0.2),
                                          Colors.black.withOpacity(0.3),
                                          Colors.black.withOpacity(0.5)
                                        ]),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //       color:
                                    //           Colors.blueGrey.withOpacity(0.2),
                                    //       blurStyle: BlurStyle.inner,
                                    //       blurRadius: 50)
                                    // ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
