import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_data_v2.dart';
import 'package:weather_app/utils/custom_colors.dart';

class CurrentWeatherWidgetV2 extends StatelessWidget {
  final WeatherDataV2 weather;

  const CurrentWeatherWidgetV2({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tempeture area
        tempeatureAreaWidget(),

        const SizedBox(
          height: 20,
        ),
        // more details - windspeed, humidity, clouds
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  String getPathIconLocal(String webPath) {
    String outputPath = webPath.replaceFirst(
        "//cdn.weatherapi.com/weather", "lib/assets/weatherV2");
    return outputPath;
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("lib/assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("lib/assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("lib/assets/icons/humidity.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                // "speed",
                "${weather.getWeather().current?.windKph ?? '--'} km/h",

                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weather.getWeather().current?.cloud ?? '--'} %",
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weather.getWeather().current?.humidity ?? '--'} %",
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget tempeatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          getPathIconLocal(weather.getWeather().current?.condition?.icon ??
              'lib/assets/icons/none.png'),
          // "lib/assets/weatherV2/64x64/day/113.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text:
                    "${weather.getWeather().current?.tempC?.round() ?? '--'}°",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: CustomColors.textColorBlack,
                )),
            TextSpan(
                text: weather.getWeather().current?.condition?.text ?? '--',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                )),
          ]),
        )
      ],
    );
  }
}
