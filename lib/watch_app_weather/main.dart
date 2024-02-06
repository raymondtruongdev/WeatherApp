import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller_watch_weather.dart';
import 'widget_weather.dart';
import 'widget_weather_forecast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the system UI overlays to FullScreen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Set watchSize value into Controller
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);
    double widthScreenDevice = MediaQuery.of(context).size.width;
    globalController.updateWatchSize(widthScreenDevice);

    globalController.getLocation();

    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchData() async {
    // Simulate fetching new data
    // await Future.delayed(const Duration(seconds: 2));
    final GlobalController globalController1 = Get.find<GlobalController>();
    print('updata new data ....');
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
                    child: ClipOval(
                    child: Container(
                      width: 390,
                      height: 390,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/watch_app_weather/assets/icons/clouds.png",
                            height: 200,
                            width: 200,
                          ),
                          const CircularProgressIndicator()
                        ],
                      ),
                    ),
                  ))
                : const WeatherWatchForeCast(),
          ),
        ));
  }
}
