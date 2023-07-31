import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:audioplayers/audioplayers.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet>
    with TickerProviderStateMixin {
  bool xExpand = false;
  GlobalKey key = GlobalKey();
  bool willExpand = false;
  bool xTap = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  print('clicked');
                },
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      color: Colors.amber,
                      width: Get.width,
                    ),
                    const Positioned(bottom: 0, left: 0, child: Text('Google')),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.only(right: 5, bottom: 5),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    print('add');
                                  },
                                  icon: const Icon(Icons.add)),
                              const SizedBox(
                                height: 5,
                              ),
                              const Icon(Icons.remove)
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Draggable(
              axis: Axis.vertical,
              onDragUpdate: (details) {
                // up == minus
                print(details.delta.dy);
                if (details.delta.dy < 0) {
                  willExpand = true;
                } else {
                  willExpand = false;
                }
              },
              onDragEnd: (details) {
                print(details.offset);
                setState(() {
                  xExpand = willExpand;
                });
              },
              feedback: Material(
                child: feedback(),
              ),
              childWhenDragging: const SizedBox.shrink(),
              child: sheet(xExpand),
            )
          ],
        ),
      ),
    );
  }

  Widget feedback() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        header(),
        body(),
        Container(height: Get.height, width: Get.width, color: Colors.white)
      ],
    );
  }

  Widget sheet(bool xExpand) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [header(), if (xExpand) body()],
    );
  }

  Widget header() {
    return Container(
      alignment: Alignment.center,
      width: Get.width,
      padding: const EdgeInsets.symmetric(vertical: 50),
      color: Colors.red,
      child: const Text('header'),
    );
  }

  Widget body() {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
        ),
        Container(
          alignment: Alignment.center,
          width: Get.width,
          padding: const EdgeInsets.symmetric(vertical: 30),
          color: Colors.white,
          child: const Text('body1'),
        ),
        Container(
          alignment: Alignment.center,
          width: Get.width,
          padding: const EdgeInsets.symmetric(vertical: 30),
          color: Colors.white,
          child: const Text('body2'),
        ),
        Container(
          alignment: Alignment.center,
          width: Get.width,
          // height: 300,
          padding: const EdgeInsets.symmetric(vertical: 30),
          color: Colors.white,
          child: const Text('body3'),
        ),
        Container(
          alignment: Alignment.center,
          width: Get.width,
          padding: const EdgeInsets.symmetric(vertical: 30),
          color: Colors.white,
          child: const Text('body4'),
        ),
        // SizedBox.expand()
      ],
    );
  }
}
