import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/utils/custom_colors.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({Key? key, required this.weatherDataDaily})
      : super(key: key);

  // string manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  String getFormattedDate(final timestamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    // final formattedDate = DateFormat('dd MMM yyyy').format(time);
    final formattedDate = DateFormat('dd MMM yyyy HH:mm').format(time);
    return formattedDate;
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
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
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
                              getDay(weatherDataDaily.daily[index].dt),
                              style: const TextStyle(
                                  color: CustomColors.textColorBlack,
                                  fontSize: 13),
                            ),
                            Text(
                              getFormattedDate(
                                  weatherDataDaily.daily[index].dt),
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
                        child: Image.asset(
                            "lib/assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                      ),
                      Text(
                          "${weatherDataDaily.daily[index].main!.tempMax!.round()}°/${weatherDataDaily.daily[index].main!.tempMin!.round()}")
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
