import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'comfort_level.dart';
import 'controller_watch_weather.dart';
import 'widget_daily.dart';
import 'widget_current.dart';
import 'widget_header.dart';
import 'widget_hourly.dart';

class WeatherWatchForeCast extends StatefulWidget {
  const WeatherWatchForeCast({super.key});

  @override
  State<WeatherWatchForeCast> createState() => _WeatherWatchForeCastState();
}

class _WeatherWatchForeCastState extends State<WeatherWatchForeCast> {
  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    double scaleRatio = globalController.getScaleRatio();
    return Center(
      child: ClipOval(
        child: Container(
          color: Colors.black,
          width: 390 * scaleRatio,
          height: 390 * scaleRatio,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 1 * scaleRatio),
              SizedBox(
                height: 80 * scaleRatio,
                child: WidgetHeader(),
              ),
              SizedBox(
                height: 160 * scaleRatio,
                child: const WidgetCurrent(),
              ),
              SizedBox(
                height: 100 * scaleRatio,
                child: const WidgetHourly(),
              ),
              Center(
                child: WidgetDaily(),
              ),
              ComfortLevel(),
            ],
          ),
        ),
      ),
    );
  }
}
