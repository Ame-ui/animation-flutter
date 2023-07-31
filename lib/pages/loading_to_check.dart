import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingToCheck extends StatefulWidget {
  const LoadingToCheck({super.key});

  @override
  State<LoadingToCheck> createState() => _LoadingToCheckState();
}

class _LoadingToCheckState extends State<LoadingToCheck> {
  bool xChild1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: GestureDetector(
          onTap: () async {
            setState(() {
              xChild1 = !xChild1;
              Future.delayed(const Duration(seconds: 3), () {
                xChild1 = !xChild1;
                setState(() {});
              });
            });
          },
          child: Container(
            width: Get.width / 2,
            height: Get.width / 2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  reverseDuration: const Duration(milliseconds: 10),
                  switchInCurve: Curves.bounceOut,
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: xChild1
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.check_circle,
                          size: 50,
                        )),
            ),
          ),
        ),
      ),
    );
  }
}
