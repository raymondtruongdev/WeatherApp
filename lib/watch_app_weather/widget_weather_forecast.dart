import 'package:flutter/material.dart';
import 'comfort_level.dart';
import 'daily_data_forecast.dart';
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
    return Center(
      child: ClipOval(
        child: Container(
          color: Colors.black,
          width: 390,
          height: 390,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(height: 1),
              SizedBox(
                height: 80,
                child: WidgetHeader(),
              ),
              const SizedBox(
                height: 160,
                child: WidgetCurrent(),
              ),
              const SizedBox(
                height: 100,
                child: WidgetHourly(),
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
