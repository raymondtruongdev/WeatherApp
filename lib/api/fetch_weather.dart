import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';
import 'package:weather_app/demo_weather_data.dart';
import 'package:weather_app/model/weather_api.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/model/weather_data_hourly.dart';
import 'package:weather_app/model/weather_data_v2.dart';
import 'package:weather_app/utils/api_url.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? weatherData;
  WeatherDataV2? weatherDataV2;

  // procecssing the data from response -> to json
  Future<Tuple2<WeatherData?, WeatherDataV2?>> processData(lat, lon) async {
    // // Query weather data from the server
    // var responseCurrent =
    //     await http.get(Uri.parse(apiURL(lat, lon, 'current')));
    // var jsonstringCurrent = responseCurrent.body;
    // print('JSON String Current: $jsonstringCurrent');
    // // Decode the JSON string to Json object
    // var jsondataCurrent = jsonDecode(jsonstringCurrent);

    // Query weather data from the server
    // var responseDaily = await http.get(Uri.parse(apiURL(lat, lon, 'forecast')));
    // var jsonstringDaily = responseDaily.body;
    // print('JSON String Daily: $jsonstringDaily');
    // // Decode the JSON string to Json object
    // var jsonDataDaily2 = jsonDecode(jsonstringDaily);

// Using weather data from a json in demo file
    var jsondataCurrent = openWeatherMapDemoCurrent;
    var jsonDataDaily = openWeatherDemoForecast;
    var jsonDataHourly = openWeatherDemoHourly;
    var jsonDataWeatherApi = weatherApiHoChiMinhForecast;

    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsondataCurrent),
        WeatherDataDaily.fromJson(jsonDataDaily),
        WeatherDataHourly.fromJson(jsonDataHourly));

    weatherDataV2 = WeatherDataV2(Weatherapi.fromJson(jsonDataWeatherApi));

    return Tuple2(weatherData, weatherDataV2);
  }
}
