import 'package:flutter/material.dart';
import 'package:pie_chart/widgets/circle_rotate_scale.dart';

class ThreeCircleRotate extends StatefulWidget {
  const ThreeCircleRotate({super.key});

  @override
  State<ThreeCircleRotate> createState() => _ThreeCircleRotateState();
}

class _ThreeCircleRotateState extends State<ThreeCircleRotate>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
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
          return Container(
            // color: Colors.amber,
            child: Stack(
              children: const [
                CircleRotateScale(
                  start: 0.69,
                  color: Colors.black,
                ),
                CircleRotateScale(
                  start: 0.33,
                  color: Colors.black,
                ),
                CircleRotateScale(
                  start: 0,
                  color: Colors.black,
                )
              ],
            ),
          );
        });
  }
}
