import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';
import 'package:tuple/tuple.dart';
import 'package:weather_app/api/fetch_weather.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/model/weather_data_v2.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;
  final weatherDataV2 = WeatherDataV2().obs;

  WeatherData getData() {
    return weatherData.value;
  }

  WeatherDataV2 getDataV2() {
    return weatherDataV2.value;
  }

  @override
  void onInit() {
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

      // print('latitude: ${value.latitude}');
      // print('longitude: ${value.longitude}');

      // calling our weather api
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((Tuple2<WeatherData?, WeatherDataV2?> result) {
        weatherData.value = result.item1 as WeatherData;
        weatherDataV2.value = result.item2 as WeatherDataV2;
        _isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
