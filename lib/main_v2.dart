import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/screens/home_screen_v2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RefreshPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RefreshPage extends StatefulWidget {
  const RefreshPage({super.key});

  @override
  State<RefreshPage> createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  List<String> data = List.generate(10, (index) => 'Item $index');

  Future<void> fetchData() async {
    // Simulate fetching new data
    // await Future.delayed(const Duration(seconds: 2));
    final GlobalController globalController1 = Get.find<GlobalController>();
    // print('updata new data ....');
    setState(() {
      globalController1.getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather-Mijo Connected'),
        ),
        body: RefreshIndicator(
          onRefresh: fetchData,
          child: Obx(
            () => globalController.checkLoading().isTrue
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "lib/assets/icons/clouds.png",
                        height: 200,
                        width: 200,
                      ),
                      const CircularProgressIndicator()
                    ],
                  ))
                : const HomeScreenV2(),
          ),
        ));
  }
}
