import 'dart:convert';

import 'package:weather_app/demo_weather_data.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/utils/api_url.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? weatherData;

  // procecssing the data from response -> to json
  Future<WeatherData> processData(lat, lon) async {
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
    var jsondataCurrent = data_hochiminh;
    var jsonDataDaily = dataForcast_hochiminh;

    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsondataCurrent),
        WeatherDataDaily.fromJson(jsonDataDaily));

    return weatherData!;
  }
}
