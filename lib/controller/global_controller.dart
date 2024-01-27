import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';
import 'package:weather_app/api/fetch_weather.dart';
import 'package:weather_app/model/weather_data.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;

  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.value) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isSeviceEnable;
    LocationPermission locationPermission;

    isSeviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!isSeviceEnable) {
      return Future.error("Location not enable");
    }
    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission denied forever");
    }

// request permission
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update our lattitude and longitude
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      // calling our weather api
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }
}
