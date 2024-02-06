import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'controller_watch_weather.dart';

class WidgetHeader extends StatelessWidget {
  WidgetHeader({
    Key? key,
  }) : super(key: key);

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

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
    // Get localtime in weather data
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
    return Container(
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              // color: Colors.red,
              child: Center(
                child: Text(
                  localtimeStr,
                  style: const TextStyle(
                      fontFamily: 'roboto',
                      fontSize: 18,
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
                child: Text(
                  city,
                  style: const TextStyle(
                      fontFamily: 'roboto',
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
