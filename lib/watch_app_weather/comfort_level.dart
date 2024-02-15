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
    double scaleRatio = globalController.getScaleRatio();
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
          height: 200 * scaleRatio,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100 * scaleRatio,
                  initialValue:
                      weather.data?.current?.humidity?.toDouble() ?? 0,
                  appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                          handlerSize: 0,
                          trackWidth: 12 * scaleRatio,
                          progressBarWidth: 12 * scaleRatio),
                      infoProperties: InfoProperties(
                        bottomLabelText: "Humidity",
                        bottomLabelStyle: TextStyle(
                            letterSpacing: 0.1 * scaleRatio,
                            fontSize: 16 * scaleRatio,
                            height: 1.5 * scaleRatio,
                            color: Colors.white),
                        mainLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30 * scaleRatio,
                            height: 1.5 * scaleRatio,
                            color: Colors.white),
                      ),
                      animationEnabled: true,
                      size: 140 * scaleRatio,
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
                width: 200 * scaleRatio,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Feels Like ",
                            style: TextStyle(
                                fontSize: 16 * scaleRatio,
                                height: 0.8 * scaleRatio,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text:
                                weather.data?.current?.condition?.text ?? '--',
                            style: TextStyle(
                                fontSize: 16 * scaleRatio,
                                height: 0.8 * scaleRatio,
                                color: Colors.white,
                                fontWeight: FontWeight.w400))
                      ]),
                    ),
                    SizedBox(height: 10 * scaleRatio),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "UV Index ",
                            style: TextStyle(
                                fontSize: 14 * scaleRatio,
                                height: 0.8 * scaleRatio,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: "${weather.data?.current?.uv ?? '--'}",
                            style: TextStyle(
                                fontSize: 14 * scaleRatio,
                                height: 0.8 * scaleRatio,
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
