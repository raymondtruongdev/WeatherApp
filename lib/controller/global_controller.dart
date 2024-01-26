import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => latitude;
  RxDouble getLongitude() => _longitude;

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
        .then((value) => {
              // update the lattitude and longitude
              latitude.value = value.latitude,
              _longitude.value = value.longitude,
              _isLoading.value = false
            });
  }
}
