import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  // var imgList = [
  //   'assets/spiderman 0.jpg',
  //   'assets/spiderman 1.jpg',
  //   'assets/spiderman 2.jpg',
  //   'assets/spiderman 3.jpg',
  //   'assets/spiderman 4.jpg',
  //   'assets/spiderman 5.jpg'
  // ];

  late ScrollController mScrollController;
  double scrollOffset = 0;
  List<String> pageList = [
    'BouncingBall',
    'RadorScan',
    'LoadingToCheck',
    'LoadingAnimation',
    'KoKPHtest',
    'PopUpMenu',
    'AnimatedBotNavi',
    'FinalGoal'
  ];

  @override
  void initState() {
    mScrollController = ScrollController();

    mScrollController.addListener(() {
      scrollOffset = (mScrollController.position.pixels / (Get.width / 2));
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    mScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
                // width: Get.width,
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    itemCount: pageList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 2,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed('/${pageList[index]}');
                          // Get.to(BouncingBallPage());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            pageList[index],
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      );
                    })),
          ],
        ));
  }
}
