import 'package:flutter/material.dart';

class AnimatedLoading extends StatefulWidget {
  const AnimatedLoading({super.key, required this.start, required this.color});

  final double start;
  final Color color;

  @override
  State<AnimatedLoading> createState() => _AnimatedLoadingState();
}

class _AnimatedLoadingState extends State<AnimatedLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;

  @override
  void initState() {
    animatedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward(from: widget.start)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animatedController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animatedController.forward();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animatedController,
        builder: (context, child) {
          return Opacity(
            opacity: animatedController.value,
            child: Transform.scale(
              scale: animatedController.value,
              child: Container(
                width: 5,
                height: 35,
                decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          );
        });
  }
}
