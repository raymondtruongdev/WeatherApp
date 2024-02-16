import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controller_watch_weather.dart';
import 'custom_colors.dart';

class WidgetDaily extends StatelessWidget {
  WidgetDaily({Key? key}) : super(key: key);

  // string manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  String getFormattedDate(final timestamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final formattedDate = DateFormat('dd MMM yyyy').format(time);
    // final formattedDate = DateFormat('dd MMM yyyy HH:mm').format(time);
    return formattedDate;
  }

  String getPathIconLocal(String webPath) {
    String outputPath = webPath.replaceFirst("//cdn.weatherapi.com/weather",
        "lib/watch_app_weather/assets/weatherV2");
    return outputPath;
  }

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 265,
      width: 300,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: CustomColors.dividerLine.withAlpha(150),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Center(
              child: Text(
                "Next Days",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    List<dynamic> weatherDaily;
    try {
      // Get list of forecast daily data
      weatherDaily = globalController.getData().data!.day!;
    } catch (e) {
      weatherDaily = [];
    }

    return SizedBox(
      height: (weatherDaily.length > 7 ? 7 : weatherDaily.length) * 60 + 10,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDaily.length > 7 ? 7 : weatherDaily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              getDay(weatherDaily[index].dateEpoch!),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              getFormattedDate(weatherDaily[index].dateEpoch!),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(getPathIconLocal(
                            "${weatherDaily[index].day!.condition!.icon}")),
                      ),
                      Text(
                        "${weatherDaily[index].day!.maxtempC!.round()}°/${weatherDaily[index].day!.mintempC!.round()}°",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              )
            ],
          );
        },
      ),
    );
  }
}
