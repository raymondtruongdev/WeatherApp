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

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];

    setState(() {
      // city = place.locality!;
      print(place.locality!);

      city =
          globalController.getData().weatherCurrent?.weatherCurrent.name ?? '';

      print(globalController.getLattitude().value);
      print(globalController.getLongitude().value);
      print(city);
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
          child: Text(datedemo, style: const TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
