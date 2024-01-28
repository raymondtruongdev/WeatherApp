import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_data_v2.dart';
import 'package:weather_app/utils/custom_colors.dart';

class DailyDataForecastV2 extends StatelessWidget {
  final WeatherDataV2 weather;
  const DailyDataForecastV2({Key? key, required this.weather})
      : super(key: key);

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
    String outputPath = webPath.replaceFirst(
        "//cdn.weatherapi.com/weather", "lib/assets/weatherV2");
    return outputPath;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: CustomColors.dividerLine.withAlpha(150),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Next Days",
              style:
                  TextStyle(color: CustomColors.textColorBlack, fontSize: 17),
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
      weatherDaily = weather.getWeather().forecast!.forecastday!;
    } catch (e) {
      weatherDaily = [];
    }

    return SizedBox(
      height: 300,
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
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              getDay(weatherDaily[index].dateEpoch!),
                              style: const TextStyle(
                                  color: CustomColors.textColorBlack,
                                  fontSize: 13),
                            ),
                            Text(
                              getFormattedDate(weatherDaily[index].dateEpoch!),
                              style: const TextStyle(
                                  color: CustomColors.textColorBlack,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(getPathIconLocal(
                            "${weatherDaily[index].day!.condition!.icon}")),
                      ),
                      Text(
                          "${weatherDaily[index].day!.maxtempC!.round()}°/${weatherDaily[index].day!.mintempC!.round()}°")
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
