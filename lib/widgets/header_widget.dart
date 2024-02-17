import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/model/weather_data_current.dart';

class HeaderWidget extends StatefulWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const HeaderWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  String city = "";
  // String date = DateFormat("yMMMMd HH:mm").format(DateTime.now());
  final date = DateFormat('dd MMMM yyyy - HH:mm').format(DateTime.now());
  String datedemo = "26 January 2024 - 22:30";
  String localtimeStr = "";

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
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

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    // ignore: unused_local_variable
    Placemark place = placemark[0];

    setState(() {
      city =
          globalController.getData().weatherCurrent?.weatherCurrent.name ?? '';

      if (globalController.getData().weatherCurrent?.weatherCurrent.dt !=
          null) {
        int localtimeEpoch =
            globalController.getData().weatherCurrent?.weatherCurrent.dt ?? 0;

        int offsetTime = globalController
                .getData()
                .weatherCurrent
                ?.weatherCurrent
                .timezone ??
            0;

        // Reformat localtime to dd MMM yyyy - HH:mm
        localtimeStr = getFormattedDate(localtimeEpoch + offsetTime);
      } else {
        localtimeStr = 'Updated at: --';
      }
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
