import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_app/watch_app_weather/controller_watch_weather.dart';
import 'package:weather_app/watch_app_weather/widget_weather_watch.dart';

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
    double heightScreenDevice = MediaQuery.of(context).size.height;
    globalController.updateWatchSize(widthScreenDevice, heightScreenDevice);

    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  Future<void> fetchData() async {
    // Simulate fetching new data
    // await Future.delayed(const Duration(seconds: 2));
    setState(() {
      globalController.getWeatherData();
    });
  }

  @override
  Widget build(BuildContext context) {
    double scaleRatio = globalController.getScaleRatio();

    return Scaffold(
        body: RefreshIndicator(
      onRefresh: fetchData,
      child: Obx(
        () => globalController.checkLoading().isTrue
            ? Center(
                child: Container(
                width: globalController.widthScreenDevice,
                height: globalController.widthScreenDevice,
                color: globalController.isCircleDevice()
                    ? Colors.black
                    : Colors.white,
                child: ClipOval(
                  child: Container(
                    width: 390 * scaleRatio,
                    height: 390 * scaleRatio,
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "lib/watch_app_weather/assets/icons/clouds.png",
                          height: 200 * scaleRatio,
                          width: 200 * scaleRatio,
                        ),
                        const CircularProgressIndicator()
                      ],
                    ),
                  ),
                ),
              ))
            : const WeatherWatchForeCast(),
      ),
    ));
  }
}
