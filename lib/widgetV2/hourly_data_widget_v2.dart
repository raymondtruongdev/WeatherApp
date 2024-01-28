import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/model/weather_data_v2.dart';
import 'package:weather_app/utils/custom_colors.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// ignore: must_be_immutable
class HourlyDataWidgetV2 extends StatelessWidget {
  final WeatherDataV2 weather;
  HourlyDataWidgetV2({Key? key, required this.weather}) : super(key: key);

  // card index
  RxInt cardIndex = GlobalController().getIndex();

// Replace Weblink to Local link Icon
  String getPathIconLocal(String webPath) {
    String outputPath = webPath.replaceFirst(
        "//cdn.weatherapi.com/weather", "lib/assets/weatherV2");
    return outputPath;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text("Today", style: TextStyle(fontSize: 18)),
        ),
        hourlyList(),
      ],
    );
  }

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  Widget hourlyList() {
    List<dynamic> weatherHourly;
    try {
      // Find Hour update current weather
      String? dateString = weather.getWeather().current?.lastUpdated;
      DateTime dateTime = DateTime.parse(dateString!);
      int hourCurrent = dateTime.hour;
      // Get list of forecast hourly data of current day and next day
      List<dynamic> weatherHourly2Day = [
        ...weather.getWeather().forecast!.forecastday![0].hour!,
        ...weather.getWeather().forecast!.forecastday![0].hour!
      ];

      // Get list of forecast hourly data from now to next 24 hours
      weatherHourly =
          weatherHourly2Day.sublist(hourCurrent + 1, weatherHourly2Day.length);
    } catch (e) {
      weatherHourly = [];
    }

    tz.initializeTimeZones();
    String tzId = globalController.getDataV2().weather?.location?.tzId ?? "";
    int offsetTime = 0;
    try {
      var timezoneObj = tz.getLocation(tzId);
      offsetTime = (timezoneObj.currentTimeZone.offset / 1000).round();
    } catch (e) {
      offsetTime = 0;
    }

    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherHourly.length > 12 ? 12 : weatherHourly.length,
        itemBuilder: (context, index) {
          return Obx((() => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                width: 90,
                margin: const EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.5, 0),
                          blurRadius: 30,
                          spreadRadius: 1,
                          color: CustomColors.dividerLine.withAlpha(150))
                    ],
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ])
                        : null),
                child: HourlyDetails(
                  index: index,
                  cardIndex: cardIndex.toInt(),
                  temp: weatherHourly[index].tempC.toInt(),
                  timeStamp: weatherHourly[index].timeEpoch.toInt(),
                  offsetTime: offsetTime,
                  weatherIcon:
                      //  "lib/assets/weatherV2/64x64/day/113.png",
                      getPathIconLocal(
                          "${weatherHourly[index]!.condition!.icon}"),
                ),
              ))));
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
    final formattedDate = DateFormat('HH:mm').format(dateLocal);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp),
              style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack,
              )),
        ),
        Container(
            margin: const EdgeInsets.all(5),
            child: Image.asset(
              weatherIcon,
              height: 40,
              width: 40,
            )),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text("$temp°",
              style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack,
              )),
        )
      ],
    );
  }
}
