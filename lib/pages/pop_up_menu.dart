import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/utils/painters/rotate.dart';

class PopUpMeny extends StatefulWidget {
  const PopUpMeny({super.key});

  @override
  State<PopUpMeny> createState() => _PopUpMenyState();
}

class _PopUpMenyState extends State<PopUpMeny>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  List<Widget> iconList = const [
    Icon(
      Icons.heart_broken,
      color: Colors.red,
    ),
    Icon(
      Icons.music_note,
      color: Colors.blue,
    ),
    Icon(
      Icons.ramen_dining_sharp,
      color: Colors.amber,
    ),
    Icon(
      Icons.play_circle_fill_rounded,
      color: Colors.green,
    )
  ];

  bool xExpand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return ClipOval(
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: Get.width,
                  height: Get.width,
                  child: Stack(
                    children: [
                      // menu item
                      // Stack(
                      //   children: iconList
                      //       .map((e) => Stack(
                      //             alignment: Alignment.center,
                      //             children: [
                      //               rotateWidget(animationController, degree)
                      //             ],
                      //           ))
                      //       .toList(),
                      // ),
                      Center(
                        child: rotateWidget(animation.value, 180, iconList[0]),
                      ),
                      Center(
                        child: rotateWidget(animation.value, 240, iconList[0]),
                      ),
                      Center(
                        child: rotateWidget(animation.value, 300, iconList[0]),
                      ),
                      Center(
                          child:
                              rotateWidget(animation.value, 360, iconList[1])),
                      Center(
                        child: InkWell(
                          radius: 20,
                          onTap: () {
                            if (animationController.status ==
                                AnimationStatus.completed) {
                              animationController.reverse();
                            } else if (animationController.status ==
                                    AnimationStatus.dismissed ||
                                animationController.value == 0) {
                              animationController.forward();
                            }
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(19)),
                            child: Icon(Icons.menu_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget rotateWidget(double aniValue, double degree, Widget child) {
    return Transform.scale(
      scale: aniValue,
      child: Container(
        width: 100,
        height: 100,
        // color: Colors.amber,
        child: CustomPaint(
          size: Size(200, 200),
          painter: RotatePainter(
              color: Colors.white,
              degree: degree * aniValue,
              circleRadius: 20,
              radius: 100),
          // child: child,
        ),
      ),
    );
  }
}
