import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedBottomNavi1 extends StatefulWidget {
  const AnimatedBottomNavi1({super.key});

  @override
  State<AnimatedBottomNavi1> createState() => _AnimatedBottomNavi1State();
}

class _AnimatedBottomNavi1State extends State<AnimatedBottomNavi1> {
  final ping = Ping('google.com');

  @override
  void initState() {
    print(ping.command);
    ping.stream.listen((event) {
      print(event.response);
    });
    super.initState();
  }

  @override
  void dispose() {
    ping.stop();
    super.dispose();
  }

  int currentPage = 0;
  List<Widget> tabPageList = [
    const TabPage(key: Key('p0'), color: Colors.red),
    const TabPage(key: Key('p1'), color: Colors.amber),
    const TabPage(key: Key('p2'), color: Colors.green),
    const TabPage(key: Key('p3'), color: Colors.blue)
  ];
  List<IconData> naviItemList = const [
    Icons.home_outlined,
    Icons.account_box_outlined,
    Icons.grid_view_outlined,
    Icons.settings_applications_outlined
  ];
  List<Widget> indicatorIconList = const [
    BotNaviIndicator(
      key: Key('i0'),
      icon: Icons.home_filled,
      label: 'Home',
      color: Colors.red,
    ),
    BotNaviIndicator(
      key: Key('i1'),
      icon: Icons.account_box,
      label: 'Account',
      color: Colors.amber,
    ),
    BotNaviIndicator(
      key: Key('i2'),
      icon: Icons.grid_view_sharp,
      label: 'Category',
      color: Colors.green,
    ),
    BotNaviIndicator(
      key: Key('i3'),
      icon: Icons.settings_applications,
      label: 'Setting',
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: tabPageList[currentPage],
          ),
          Positioned(
            left: 15,
            bottom: 20,
            child: Container(
              width: Get.width - 30,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: naviItemList
                    .map(
                      (e) => Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              changeTab(naviItemList.indexOf(e));
                            },
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: currentPage == naviItemList.indexOf(e)
                                  ? 0
                                  : 1,
                              child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Icon(e)),
                            ),
                          )),
                    )
                    .toList(),
              ),
            ),
          ),
          AnimatedPositioned(
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 300),
              bottom: 30,
              left: indicatorPosition(),
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: indicatorIconList[currentPage]))
        ],
      ),
    );
  }

  void changeTab(int index) {
    setState(() {
      currentPage = index;
    });
  }

  double indicatorPosition() {
    switch (currentPage) {
      case 0:
        return Get.width * 0.095;
      case 1:
        return Get.width * 0.32;

      case 2:
        return Get.width * 0.56;

      case 3:
        return Get.width * 0.79;
    }
    return 0;
  }
}

class TabPage extends StatelessWidget {
  const TabPage({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class BotNaviIndicator extends StatelessWidget {
  const BotNaviIndicator(
      {super.key,
      required this.icon,
      required this.label,
      required this.color});
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: CircleAvatar(
              backgroundColor: color,
              radius: 23,
              child: Icon(
                icon,
                color: Colors.white,
              )),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 10),
        )
      ],
    );
  }
}
