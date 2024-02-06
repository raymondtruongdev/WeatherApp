import 'package:flutter/material.dart';
import 'widget_current.dart';
import 'widget_header.dart';
import 'widget_hourly.dart';

class WeatherWatch extends StatefulWidget {
  const WeatherWatch({super.key});

  @override
  State<WeatherWatch> createState() => _WeatherWatchState();
}

class _WeatherWatchState extends State<WeatherWatch> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: SizedBox(
          width: 390,
          height: 390,
          child: Container(
            color: Colors.black,
            child: Flex(
              direction: Axis.vertical,
              children: [
                Flexible(flex: 1, child: WidgetHeader()),
                const Flexible(
                  flex: 2,
                  child: WidgetCurrent(),
                ),
                const Flexible(
                  flex: 2,
                  child: WidgetHourly(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
