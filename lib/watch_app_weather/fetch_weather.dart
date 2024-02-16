import 'dart:convert';
import 'package:weather_app/demo_weather_data.dart';

import 'package:http/http.dart' as http;

import 'api_url.dart';
import 'weather_api.dart';
import 'weather_data_v2.dart';

class FetchWeather {
  WeatherApiData? weatherApiData;

  // procecssing the data from response -> to json
  Future<WeatherApiData?> processData(lat, lon) async {
    dynamic jsonDataWeatherApi;

    String onlineMode = 'online';

    switch (onlineMode) {
      case 'online':

        // Query weather data from the server WeatherApi
        try {
          var response = await http.get(Uri.parse(apiURLWeatherApi(lat, lon)));
          var jsonstring = response.body;
          // var jsonstring = response.body;
          // print('JSON WeatherApi : $jsonstring');
          jsonDataWeatherApi = jsonDecode(jsonstring);
          weatherApiData =
              WeatherApiData(WeatherApiDataParser.fromJson(jsonDataWeatherApi));
        } catch (e) {
          // Return empty data
          weatherApiData = WeatherApiData();
        }

        break;

      default: // Using the demo data
        // Using weather data from a json in demo file
        jsonDataWeatherApi = hochiminh;
        weatherApiData =
            WeatherApiData(WeatherApiDataParser.fromJson(jsonDataWeatherApi));
    }

    return (weatherApiData);
  }
}
