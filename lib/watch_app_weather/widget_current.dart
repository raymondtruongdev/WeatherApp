import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_watch_weather.dart';

class WidgetCurrent extends StatelessWidget {
  const WidgetCurrent({
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

    String tempCurrentStr = '';
    if (globalController.getData().data?.current?.tempC == null) {
      tempCurrentStr = '';
    } else {
      tempCurrentStr =
          '${globalController.getData().data?.current?.tempC?.toStringAsFixed(0)}°';
    }

    String tempMaxStr = '';
    if (globalController.getData().data?.day?[0].day?.maxtempC == null) {
      tempMaxStr = '';
    } else {
      tempMaxStr =
          '${globalController.getData().data?.day?[0].day?.maxtempC?.toStringAsFixed(0)}°';
    }

    String tempMinStr = '';
    if (globalController.getData().data?.day?[0].day?.mintempC == null) {
      tempMinStr = '';
    } else {
      tempMinStr =
          '${globalController.getData().data?.day?[0].day?.mintempC?.toStringAsFixed(0)}°';
    }

    final String pathImage = getPathIconLocal(
        globalController.getData().data?.current?.condition?.icon ??
            "lib/watch_app_weather/assets/icons/none.png");

    double scaleRatio = globalController.getScaleRatio();

    return Flex(direction: Axis.horizontal, children: [
      Flexible(
          flex: 1,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Flexible(
                flex: 1,
                child: tempMaxStr.isEmpty
                    ? Container()
                    : Container(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.only(right: 15 * scaleRatio),
                        child: Text(
                          tempMaxStr,
                          style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 25 * scaleRatio,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              ),
              Flexible(
                flex: 2,
                child: tempCurrentStr.isEmpty
                    ? Container()
                    : Container(
                        height: double.infinity,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 5 * scaleRatio),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            tempCurrentStr,
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 70 * scaleRatio,
                              height:
                                  1, // Changed height from 0 to 1, assuming you want normal height
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
              ),
              Flexible(
                flex: 1,
                child: tempMinStr.isEmpty
                    ? Container()
                    : Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(right: 15 * scaleRatio),
                        child: Text(
                          tempMinStr,
                          style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 25 * scaleRatio,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
              ),
            ],
          )),
      Flexible(
        flex: 1,
        child: Container(
          // color: Colors.yellow,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15 * scaleRatio),
          child: SizedBox(
            height: double.infinity,
            // "lib/assets/weatherV2/64x64/day/113.png",
            // 'lib/assets/icons/none.png'
            child: Image.asset(
              // "lib/assets/weatherV2/64x64/day/116.png",
              pathImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ]);
  }
}
