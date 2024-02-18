import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';
import 'package:weather_app/watch_app_weather/fetch_weather.dart';

import 'weather_data_v2.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  double _watchSize = 0.0;
  double _latitude = 0.0;
  double _longitude = 0.0;
  int _cityIndex = 0;
  double _scaleRatio = 0.0;
  bool isSeviceEnable = false;
  bool _isCircleDevice = false;
  String errorMessage = '';
  double widthScreenDevice = 0.0;
  double heightScreenDevice = 0.0;

  LocationPermission _locationPermission = LocationPermission.unableToDetermine;

  RxBool checkLoading() => _isLoading;
  double getLattitude() => _latitude;
  double getLongitude() => _longitude;
  int getCityIndex() => _cityIndex;
  double getScaleRatio() => _scaleRatio;
  LocationPermission getlocationPermission() => _locationPermission;
  bool isCircleDevice() => _isCircleDevice;

  setCityIndex(int value) {
    _cityIndex = value;
  }

  setLatitude(double value) {
    _latitude = value;
  }

  setLongitude(double value) {
    _longitude = value;
  }

  WeatherApiData weatherData = WeatherApiData();

  WeatherApiData getData() {
    return weatherData;
  }

  void updateWatchSize(double widthScreen, double heightScreen) {
    // If widthScreen <       0   : _watchSize = 0;
    // If widthScreen > maxScreen : _watchSize = maxScreen;
    // If 0 <= widthScreen <= maxScreen : _watchSize = widthScreen;
    double maxScreen = 1080.0; // 384.0;
    _watchSize = widthScreen.clamp(0, maxScreen);

    double defaultWatchSize = 390;

    _scaleRatio = _watchSize.toDouble() / defaultWatchSize;

    if (heightScreen <= widthScreen * 1.1) {
      // heigth < 110% of width => circle face
      _isCircleDevice = true;
      print('This is circle device');
    } else {
      _isCircleDevice = false;
      print('This is NOT circle device');
    }
    print('widthScreen Controller: $widthScreen');
    print('heightScreen Controller: $heightScreen');
    print('ScreenIsCircle Controller: $_isCircleDevice()');
    widthScreenDevice = widthScreen;
    heightScreenDevice = heightScreen;
  }

  @override
  void onInit() {
    // _cityIndex.value = 1;
    _watchSize = 1080.0;

    super.onInit();
  }

  Future<void> getWeatherData() async {
    if (_cityIndex.toInt() == 0) {
      try {
        _isLoading.value = true;
        await checkInternetConnectivity();
        await checkLocationPermission();
        await getCurrentLocation();
        await getNewWeatherData();
      } catch (e) {
        // print('GPS error');
      }
    } else {
      _isLoading.value = true;
      await checkInternetConnectivity();
      await getNewWeatherData();
    }
  }

  Future<void> checkLocationPermission() async {
    _isLoading.value = true;
    bool isSeviceEnableStatus;
    isSeviceEnableStatus = await Geolocator.isLocationServiceEnabled();
    if (!isSeviceEnableStatus) {
      // return Future.error("Location not enable");
      // There is no service enable
      errorMessage = 'GPS NOT AVILABLE';
      isSeviceEnable = false;
      _isLoading.value = false;
      return;
    }
    // status of permission
    _locationPermission = await Geolocator.checkPermission();

    if ((_locationPermission == LocationPermission.whileInUse) ||
        (_locationPermission == LocationPermission.always)) {
      isSeviceEnable = true;
      _isLoading.value = false;
      return;
    }

    if (_locationPermission == LocationPermission.deniedForever) {
      isSeviceEnable = true;
      _isLoading.value = false;
      errorMessage = 'Check Location Permission';
      return Future.error("Location permission denied forever");
    }

// request permission
    if (_locationPermission == LocationPermission.denied) {
      isSeviceEnable = true;
      errorMessage = 'Check Location Permission';
      _locationPermission = await Geolocator.requestPermission();
      if (_locationPermission == LocationPermission.denied) {
        _isLoading.value = false;
        errorMessage = 'Check Location Permission';
        return Future.error("Location permission denied");
      } else {
        _isLoading.value = false;
      }
    }
  }

  Future<void> getCurrentLocation() async {
    _isLoading.value = true;
    if ((isSeviceEnable) &&
        ((_locationPermission == LocationPermission.whileInUse) ||
            (_locationPermission == LocationPermission.always))) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((value) {
        // update our lattitude and longitude
        _latitude = value.latitude;
        _longitude = value.longitude;
        _isLoading.value = false;
      });
    } else {
      _latitude = 0;
      _longitude = 0;
      _isLoading.value = false;
    }
  }

  Future<void> getNewWeatherData() async {
    if ((_latitude.toDouble() != 0) && (_longitude.toDouble() != 0)) {
      _isLoading.value = true;
      try {
        FetchWeather()
            .processData(_latitude, _longitude)
            .then((WeatherApiData? result) {
          weatherData = result as WeatherApiData;
          _isLoading.value = false;
        });
      } catch (e) {
        _isLoading.value = false;
      }
    } else {
      // _isLoading.value = true;
      weatherData = (WeatherApiData());
      await Future.delayed(const Duration(milliseconds: 200));
      _isLoading.value = false;
    }
    // _isLoading.value = false;
  }

  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // print('No Internet connection');
      errorMessage = 'No Internet connection';
      return false;
    } else {
      // print('Internet connection available');
      return true;
    }
  }
}
