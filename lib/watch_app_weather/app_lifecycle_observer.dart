import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/logger_custom.dart';
import 'package:weather_app/watch_app_weather/controller_watch_weather.dart';

final GlobalController globalController =
    Get.put(GlobalController(), permanent: true);

final CustomLogger logger = CustomLogger();

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // Save data when the app is closed or paused
    if (state == AppLifecycleState.inactive) {
      await saveDataState();
    }
  }

  Future<void> saveDataState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int cityIndex = globalController.getCityIndex();
    await prefs.setInt('_cityIndex', cityIndex);
    await prefs.setDouble('_latitude', globalController.getLattitude());
    await prefs.setDouble('_longitude', globalController.getLongitude());
    logger.info('Save state data success');
  }
}
