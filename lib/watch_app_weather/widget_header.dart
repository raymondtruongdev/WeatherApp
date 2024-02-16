import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'controller_watch_weather.dart';

final GlobalController globalController =
    Get.put(GlobalController(), permanent: true);

// ignore: must_be_immutable
class WidgetHeader extends StatelessWidget {
  WidgetHeader({
    Key? key,
  }) : super(key: key);

  String localtimeStr = "";
  String country = "";
  late String hour;
  late String city;

  getData() async {
    // Get City using (lat,lon)
    // List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    // Placemark place = placemark[0];
    // String cityPlace = place.locality!;

    tz.initializeTimeZones();

    String tzId = globalController.getData().data?.location?.tzId ?? "";
    int offsetTime = 0;
    try {
      var timezoneObj = tz.getLocation(tzId);
      offsetTime = (timezoneObj.currentTimeZone.offset / 1000).round();
    } catch (e) {
      offsetTime = 0;
    }

    int localtimeEpoch =
        globalController.getData().data?.location?.localtimeEpoch ?? 0;

    // Get City from Weather data
    country = globalController.getData().data?.location?.country ?? '';
    city = globalController.getData().data?.location?.name ?? 'Error Network';

    if (city == 'Error Network') {
      if ((globalController.getlocationPermission() ==
              LocationPermission.denied) ||
          (globalController.getlocationPermission() ==
              LocationPermission.deniedForever)) {
        city = 'Check Location Permission';
      }
    }
    // Get localtime in weather data
    // ignore: unused_local_variable
    String localtimeStrOrg =
        globalController.getData().data?.location?.localtime ?? "";

    // Reformat localtime to dd MMM yyyy - HH:mm
    localtimeStr = getFormattedDate(localtimeEpoch + offsetTime);
  }

  String getFormattedDate(final timestamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var dateLocal = time.toUtc();
    // final formattedDate =
    //     'Updated on ${DateFormat('dd MMM yyyy').format(dateLocal)}, at ${DateFormat('HH:mm').format(dateLocal)}';
    final formattedDate = 'Updated at ${DateFormat('HH:mm').format(dateLocal)}';
    // DateFormat('dd MMM yyyy - HH:mm').format(dateLocal)
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    double scaleRatio = globalController.getScaleRatio();

    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(top: 15 * scaleRatio),
            // color: Colors.red,
            child: Center(
              child: Text(
                localtimeStr,
                style: TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 18 * scaleRatio,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(top: 0),
            // color: Colors.green,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF04CDF4), // Set the button color
                ),
                onPressed: () {
                  // Navigate to the second page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CityListPage()),
                  );
                },
                child: Text(
                  city,
                  style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: 20 * scaleRatio,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CityListPage extends StatelessWidget {
  final List<City> cities = [
    City(name: 'Current Location', latitude: 0, longitude: 0),
    City(name: 'Ho Chi Minh', latitude: 10.7726017, longitude: 106.697845),
    City(name: 'New York', latitude: 40.7128, longitude: -74.0060),
    City(name: 'London', latitude: 51.5074, longitude: -0.1278),
    City(name: 'Tokyo', latitude: 35.6895, longitude: 139.6917),
    City(name: 'Paris', latitude: 48.8566, longitude: 2.3522),
    City(name: 'Sydney', latitude: -33.8688, longitude: 151.2093),
  ];

  CityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedCityIndex = globalController.getCityIndex();
    double scaleRatio = globalController.getScaleRatio();

    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: ClipOval(
                child: Container(
          color: Colors.black,
          width: 390 * scaleRatio,
          height: 390 * scaleRatio,
          child: Column(
            children: [
              Container(
                height: 50 * scaleRatio,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'City list',
                    style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 25 * scaleRatio,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 300 * scaleRatio,
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // select the city index
                        globalController.setCityIndex(index);
                        globalController.setLatitude(cities[index].latitude);
                        globalController.setLongitude(cities[index].longitude);
                        globalController.getWeatherData();
                        Navigator.pop(
                            context, cities[index]); // Return selected city
                      },
                      child: Container(
                        height: 50 * scaleRatio,
                        width: double.infinity,
                        color: (index == selectedCityIndex.toInt())
                            ? const Color(0xFF04CDF4)
                            : Colors.black,
                        child: Center(
                          child: Text(
                            cities[index].name,
                            style: TextStyle(
                                fontFamily: 'roboto',
                                fontSize: 25 * scaleRatio,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ))));
  }
}

class City {
  final String name;
  final double latitude;
  final double longitude;

  City({
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}
