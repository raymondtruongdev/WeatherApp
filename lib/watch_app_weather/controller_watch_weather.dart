import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';
import 'package:weather_app/watch_app_weather/fetch_weather.dart';

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
  bool _isCircleDevice = false;
  String errorMessage = '';
  double widthScreenDevice = 0.0;
  double heightScreenDevice = 0.0;

  LocationPermission _locationPermission = LocationPermission.unableToDetermine;

  RxBool checkLoading() => _isLoading;
  RxBool checkTimeout() => _isTimeout;
  RxDouble getLattitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  RxInt getIndex() => _currentIndex;
  RxInt getCityIndex() => _cityIndex;
  double getScaleRatio() => _scaleRatio;
  LocationPermission getlocationPermission() => _locationPermission;
  bool isCircleDevice() => _isCircleDevice;

  setCityIndex(int value) {
    _cityIndex.value = value;
  }

  setLatitude(double value) {
    _latitude.value = value;
  }

  setLongitude(double value) {
    _longitude.value = value;
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
    _watchSize.value = widthScreen.clamp(0, maxScreen);

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
    _watchSize.value = 1080.0;

    super.onInit();
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    if (_cityIndex.toInt() == 0) {
      try {
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
      isSeviceEnable = false;
      _isLoading.value = false;
      return;
    }
    // status of permission
    _locationPermission = await Geolocator.checkPermission();

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
    if ((isSeviceEnable) &&
        ((_locationPermission == LocationPermission.whileInUse) ||
            (_locationPermission == LocationPermission.always))) {
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
      try {
        FetchWeather()
            .processData(_latitude.value, _longitude.value)
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
