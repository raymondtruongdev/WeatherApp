import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'controller_watch_weather.dart';
import 'custom_colors.dart';
import 'weather_api.dart';

class WidgetHourly extends StatelessWidget {
  const WidgetHourly({
    Key? key,
  }) : super(key: key);

  String getPathIconLocal(String webPath) {
    String outputPath = webPath.replaceFirst("//cdn.weatherapi.com/weather",
        "lib/watch_app_weather/assets/weatherV2");
    return outputPath;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    List<List<Hour>> dataHourly = globalController.getData().hour;

    List<dynamic> weatherHourly;

    try {
      // Find Hour update current weather
      String? dateString =
          globalController.getData().data?.current?.lastUpdated;
      DateTime dateTime = DateTime.parse(dateString!);
      int hourCurrent = dateTime.hour;
      // Get list of forecast hourly data of current day and next day
      List<dynamic> weatherHourly2Day = [
        ...dataHourly[0],
        ...dataHourly[1],
      ];

      // Get list of forecast hourly data from now to next 24 hours
      weatherHourly =
          weatherHourly2Day.sublist(hourCurrent + 1, weatherHourly2Day.length);
    } catch (e) {
      weatherHourly = [];
    }

    tz.initializeTimeZones();
    String tzId = globalController.getData().data?.location?.tzId ?? "";
    int offsetTime = 0;
    try {
      var timezoneObj = tz.getLocation(tzId);
      offsetTime = (timezoneObj.currentTimeZone.offset / 1000).round();
    } catch (e) {
      offsetTime = 0;
    }

    return Container(
      height: 100,
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherHourly.length > 5 ? 5 : weatherHourly.length,
        // itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
              // onTap: () {
              //   cardIndex.value = index;
              // },
              child: Container(
            width: 50,
            margin: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child: HourlyDetails(
              index: index,
              cardIndex: index, //cardIndex.toInt(),
              temp: weatherHourly[index].tempC.toInt(),
              timeStamp: weatherHourly[index].timeEpoch.toInt(),
              offsetTime: offsetTime,
              weatherIcon:
                  //  "lib/watch_app_weather/assets/weatherV2/64x64/day/113.png",
                  getPathIconLocal("${weatherHourly[index]!.condition!.icon}"),
            ),
          ));
        },
      ),
    );
  }
}

// hourly details class
// ignore: must_be_immutable
class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timeStamp;
  int offsetTime;
  String weatherIcon;

  HourlyDetails(
      {Key? key,
      required this.cardIndex,
      required this.index,
      required this.timeStamp,
      required this.temp,
      required this.offsetTime,
      required this.weatherIcon})
      : super(key: key);

  String getTime(final timeStamp) {
    DateTime time =
        DateTime.fromMillisecondsSinceEpoch((timeStamp + offsetTime) * 1000);
    var dateLocal = time.toUtc();
    final formattedDate = DateFormat('HH').format(dateLocal);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: Text("$temp°",
              style: TextStyle(
                  color: cardIndex == index
                      ? Colors.white
                      : CustomColors.textColorBlack,
                  fontFamily: 'roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
            // color: Colors.red,
            margin: const EdgeInsets.all(0),
            child: Image.asset(
              weatherIcon,
              height: 35,
              width: 35,
            )),
        Container(
          margin: const EdgeInsets.only(top: 0),
          child: Text(getTime(timeStamp),
              style: TextStyle(
                  color: cardIndex == index
                      ? Colors.white
                      : CustomColors.textColorBlack,
                  fontFamily: 'roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
