import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/model/weather_data_v2.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class HeaderWidgetV2 extends StatefulWidget {
  final WeatherDataV2 weather;

  const HeaderWidgetV2({Key? key, required this.weather}) : super(key: key);

  @override
  State<HeaderWidgetV2> createState() => _HeaderWidgetV2State();
}

class _HeaderWidgetV2State extends State<HeaderWidgetV2> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  String city = "";
  String localtimeStr = "";
  String country = "";

  int localtimeEpoch = 0;

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  String getFormattedDate(final timestamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var dateLocal = time.toUtc();
    final formattedDate =
        'Updated on ${DateFormat('dd MMM yyyy').format(dateLocal)}, at ${DateFormat('HH:mm').format(dateLocal)}';
    // DateFormat('dd MMM yyyy - HH:mm').format(dateLocal)
    return formattedDate;
  }

  getAddress(lat, lon) async {
    // Get City using (lat,lon)
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    String cityPlace = place.locality!;

    tz.initializeTimeZones();

    String tzId = globalController.getDataV2().weather?.location?.tzId ?? "";
    int offsetTime = 0;
    try {
      var timezoneObj = tz.getLocation(tzId);
      offsetTime = (timezoneObj.currentTimeZone.offset / 1000).round();
    } catch (e) {
      offsetTime = 0;
    }

    int localtimeEpoch =
        globalController.getDataV2().weather?.location?.localtimeEpoch ?? 0;

    setState(() {
      // Get City from Weather data
      country = globalController.getDataV2().weather?.location?.country ?? '';
      city = globalController.getDataV2().weather?.location?.name ??
          'Error Network';
      // Get localtime in weather data
      String localtimeStrOrg =
          globalController.getDataV2().weather?.location?.localtime ?? "";

      // Reformat localtime to dd MMM yyyy - HH:mm
      localtimeStr = getFormattedDate(localtimeEpoch + offsetTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(city, style: const TextStyle(fontSize: 35)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(localtimeStr, style: const TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
