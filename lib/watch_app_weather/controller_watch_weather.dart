import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';

import 'fetch_weather.dart';
import 'weather_data_v2.dart';

class GlobalController extends GetxController {
  final RxDouble _watchSize = 0.0.obs;
  final RxBool _isLoading = true.obs;
  final RxBool _isTimeout = false.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;
  final RxInt _cityIndex = 0.obs;

  RxBool checkLoading() => _isLoading;
  RxBool checkTimeout() => _isTimeout;
  RxDouble getLattitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  RxInt getIndex() => _currentIndex;
  RxInt getCityIndex() => _cityIndex;

  setCityIndex(int value) {
    _cityIndex.value = value;
  }

  setLatitude(double value) {
    _latitude.value = value;
  }

  setLongitude(double value) {
    _longitude.value = value;
  }

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
    if (_cityIndex == 0) {
      try {
        getLocationGoogleService();
      } catch (e) {
        print('GPS error');
        getLocationWifi();
      }
    } else {
      getLocationWifi();
    }
  }

  getLocationWifi() async {
    _isLoading.value = true;

    // calling our weather api
    return FetchWeather()
        .processData(_latitude.value, _longitude.value)
        .then((WeatherApiData? result) {
      weatherData.value = result as WeatherApiData;
      _isLoading.value = false;
    });
  }

  getLocationGoogleService() async {
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
}
