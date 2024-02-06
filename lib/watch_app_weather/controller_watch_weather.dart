import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';

import 'fetch_weather.dart';
import 'weather_data_v2.dart';

class GlobalController extends GetxController {
  final RxDouble _watchSize = 0.0.obs;
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherApiData().obs;

  WeatherApiData getData() {
    return weatherData.value;
  }

  void updateWatchSize(double widthScreenDevice) {
    // If widthScreenDevice <       0   : _watchSize = 0;
    // If widthScreenDevice > maxScreen : _watchSize = maxScreen;
    // If 0 <= widthScreenDevice <= maxScreen : _watchSize = widthScreenDevice;
    double maxScreen = 1080.0; // 384.0;
    _watchSize.value = widthScreenDevice.clamp(0, maxScreen);
  }

  @override
  void onInit() {
    _watchSize.value = 1080.0;
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isSeviceEnable;
    LocationPermission locationPermission;

    _isLoading.value = true;

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

      print('latitude: ${value.latitude}');
      print('longitude: ${value.longitude}');

      // calling our weather api
      return FetchWeather()
          .processData(value.latitude, value.longitude)
          .then((WeatherApiData? result) {
        weatherData.value = result as WeatherApiData;
        _isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
