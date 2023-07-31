import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/utils/route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.home,
      getPages: RouteNames.getPages,
      // home: BouncingBallPage(),
    );
  }
}
