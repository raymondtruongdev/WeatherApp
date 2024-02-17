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
  double _scaleRatio = 0.0;

  bool isSeviceEnable = false;
  LocationPermission _locationPermission = LocationPermission.denied;

  RxBool checkLoading() => _isLoading;
  RxBool checkTimeout() => _isTimeout;
  RxDouble getLattitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  RxInt getIndex() => _currentIndex;
  RxInt getCityIndex() => _cityIndex;
  double getScaleRatio() => _scaleRatio;
  LocationPermission getlocationPermission() => _locationPermission;

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

    double defaultWatchSize = 390;

    _scaleRatio = _watchSize.toDouble() / defaultWatchSize;
  }

  @override
  void onInit() {
    // _cityIndex.value = 1;
    _watchSize.value = 1080.0;

    super.onInit();
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    if (_cityIndex.toInt() == 0) {
      try {
        await checkLocationPermission();
        await getCurrentLocation();
        await getNewWeatherData();
      } catch (e) {
        // print('GPS error');
      }
    } else {
      getNewWeatherData();
    }
  }

  Future<void> checkLocationPermission() async {
    bool isSeviceEnableStatus;

    isSeviceEnable = false;
    _isLoading.value = true;

    isSeviceEnableStatus = await Geolocator.isLocationServiceEnabled();
    if (!isSeviceEnableStatus) {
      // return Future.error("Location not enable");

      // There is no service enable
      isSeviceEnable = false;
      _isLoading.value = false;
      return;
    }
    // status of permission
    _locationPermission = await Geolocator.checkPermission();

    if (_locationPermission == LocationPermission.deniedForever) {
      _isLoading.value = false;
      return Future.error("Location permission denied forever");
    }

// request permission
    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
      if (_locationPermission == LocationPermission.denied) {
        _isLoading.value = false;
        return Future.error("Location permission denied");
      }
    }
    if ((_locationPermission == LocationPermission.whileInUse) ||
        (_locationPermission == LocationPermission.always)) {
      isSeviceEnable = true;
    }
  }

  Future<void> getCurrentLocation() async {
    if (isSeviceEnable) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((value) {
        // update our lattitude and longitude
        _latitude.value = value.latitude;
        _longitude.value = value.longitude;
      });
    } else {
      _latitude.value = 0;
      _longitude.value = 0;
    }
  }

  Future<void> getNewWeatherData() async {
    if ((_latitude.toDouble() != 0) && (_longitude.toDouble() != 0)) {
      _isLoading.value = true;
      FetchWeather()
          .processData(_latitude.value, _longitude.value)
          .then((WeatherApiData? result) {
        weatherData.value = result as WeatherApiData;
        _isLoading.value = false;
      });
    } else {
      _isLoading.value = true;
      weatherData.value = (WeatherApiData());
      await Future.delayed(const Duration(milliseconds: 200));
      _isLoading.value = false;
    }
  }
}
