import 'dart:convert';

import 'package:weather_app/demo_weather_data.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/utils/api_url.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? weatherData;

  // procecssing the data from response -> to json
  Future<WeatherData> processData(lat, lon, dataType) async {
    // Query weather data from the server
    var response = await http.get(Uri.parse(apiURL(lat, lon, dataType)));
    var jsonString = response.body;
    print('JSON String: $jsonString');
    // Decode the JSON string to Json object
    var jsonData = jsonDecode(jsonString);

// Using weather data from a json in demo file
    // var jsonData = data_hochiminh;

    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonData));

    return weatherData!;
  }
}
