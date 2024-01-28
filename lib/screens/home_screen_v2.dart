import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/utils/custom_colors.dart';
import 'package:weather_app/widgetV2/comfort_level_v2.dart';
import 'package:weather_app/widgetV2/current_data_widget_v2.dart';
import 'package:weather_app/widgetV2/daily_data_forecast_v2.dart';
import 'package:weather_app/widgetV2/header_widget_v2.dart';
import 'package:weather_app/widgetV2/hourly_data_widget_v2.dart';

class HomeScreenV2 extends StatefulWidget {
  const HomeScreenV2({Key? key}) : super(key: key);

  @override
  State<HomeScreenV2> createState() => _HomeScreenV2State();
}

class _HomeScreenV2State extends State<HomeScreenV2> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 30),
                  HeaderWidgetV2(
                    weather: globalController.getDataV2(),
                  ),
                  const SizedBox(height: 30),
                  CurrentWeatherWidgetV2(
                    weather: globalController.getDataV2(),
                  ),
                  const SizedBox(height: 20),
                  HourlyDataWidgetV2(weather: globalController.getDataV2()),
                  DailyDataForecastV2(
                    weather: globalController.getDataV2(),
                  ),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ComfortLevelV2(weather: globalController.getDataV2())
                ],
              ),
      )),
    );
  }
}
