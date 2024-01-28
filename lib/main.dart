import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/home_screen_v2.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreenV2(),
      title: "Weather",
      debugShowCheckedModeBanner: false,
    );
  }
}
