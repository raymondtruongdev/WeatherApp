import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'controller_watch_weather.dart';
import 'weather_data_v2.dart';

class ComfortLevel extends StatelessWidget {
  ComfortLevel({Key? key}) : super(key: key);

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    WeatherApiData weather = globalController.getData();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: const Text(
            "Comfort Level",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 200,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue:
                      weather.data?.current?.humidity?.toDouble() ?? 0,
                  appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                          handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                      infoProperties: InfoProperties(
                        bottomLabelText: "Humidity",
                        bottomLabelStyle: const TextStyle(
                            letterSpacing: 0.1,
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.white),
                        mainLabelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            height: 1.5,
                            color: Colors.white),
                      ),
                      animationEnabled: true,
                      size: 140,
                      customColors: CustomSliderColors(
                          hideShadow: true,
                          trackColor:
                              // CustomColors.firstGradientColor.withAlpha(100),
                              const Color(0xff07CDF4).withAlpha(100),
                          progressBarColors: [
                            // CustomColors.firstGradientColor,
                            //  CustomColors.secondGradientColor
                            const Color(0xff07CDF4),
                            const Color.fromARGB(255, 102, 250, 245),
                          ])),
                ),
              ),
              SizedBox(
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "Feels Like ",
                            style: TextStyle(
                                fontSize: 16,
                                height: 0.8,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text:
                                weather.data?.current?.condition?.text ?? '--',
                            style: const TextStyle(
                                fontSize: 16,
                                height: 0.8,
                                color: Colors.white,
                                fontWeight: FontWeight.w400))
                      ]),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "UV Index ",
                            style: TextStyle(
                                fontSize: 14,
                                height: 0.8,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: "${weather.data?.current?.uv ?? '--'}",
                            style: const TextStyle(
                                fontSize: 14,
                                height: 0.8,
                                color: Colors.white,
                                fontWeight: FontWeight.w400))
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
