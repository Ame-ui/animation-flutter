import 'package:get/get.dart';
import 'package:pie_chart/pages/animated_bottom_navi1.dart';
import 'package:pie_chart/pages/ball_bounce.dart';
import 'package:pie_chart/pages/final_goal.dart';
import 'package:pie_chart/pages/home.dart';
import 'package:pie_chart/pages/ko_kph_test.dart';
import 'package:pie_chart/pages/loading_animation.dart';
import 'package:pie_chart/pages/loading_to_check.dart';
import 'package:pie_chart/pages/pop_up_menu.dart';
import 'package:pie_chart/pages/rador_scan.dart';

class RouteNames {
  static const String home = '/';
  static const String bouncingBall = '/BouncingBall';
  static const String radorScan = '/RadorScan';
  static const String loadingToCheck = '/LoadingToCheck';
  static const String loadingAnimation = '/LoadingAnimation';
  static const String koKphTest = '/KoKPHtest';
  static const String popUpMeny = '/PopUpMenu';
  static const String animatedBotNavi = '/AnimatedBotNavi';
  static const String finalGoal = '/FinalGoal';

  static List<GetPage> getPages = [
    GetPage(name: home, page: () => const Home()),
    GetPage(name: bouncingBall, page: () => const BouncingBallPage()),
    GetPage(name: radorScan, page: () => const RadorScanPage()),
    GetPage(name: loadingToCheck, page: () => const LoadingToCheck()),
    GetPage(name: loadingAnimation, page: () => const LoadingAnimation()),
    GetPage(name: koKphTest, page: () => const KoKphTest()),
    GetPage(name: popUpMeny, page: () => const PopUpMeny()),
    GetPage(name: animatedBotNavi, page: () => const AnimatedBottomNavi1()),
    GetPage(name: finalGoal, page: () => const FinalGoal()),
  ];
}
