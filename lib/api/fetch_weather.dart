import 'dart:convert';
import 'package:tuple/tuple.dart';
import 'package:weather_app/demo_weather_data.dart';
import 'package:weather_app/model/weather_api.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/model/weather_data_hourly.dart';
import 'package:weather_app/model/weather_data_v2.dart';
import 'package:weather_app/utils/api_url.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? weatherData;
  WeatherDataV2? weatherDataV2;

  // procecssing the data from response -> to json
  Future<Tuple2<WeatherData?, WeatherDataV2?>> processData(lat, lon) async {
    dynamic jsonDataWeatherApi;
    dynamic jsondataCurrent;
    dynamic jsonDataDaily;
    dynamic jsonDataHourly;

    String onlineMode = 'online';

    switch (onlineMode) {
      case 'online':
        // // Query weather data from the server OpenWeather
        // var responseCurrent =
        //     await http.get(Uri.parse(apiURL(lat, lon, 'current')));
        // var jsonstringCurrent = responseCurrent.body;
        // print('JSON OpenWeather Current: $jsonstringCurrent');
        // jsondataCurrent = jsonDecode(jsonstringCurrent);
        // var responseDaily =
        //     await http.get(Uri.parse(apiURL(lat, lon, 'forecast')));
        // var jsonstringDaily = responseDaily.body;
        // print('JSON OpenWeather Daily: $jsonstringDaily');
        // jsonDataDaily = jsonDecode(jsonstringDaily);

        jsondataCurrent = openWeatherMapDemoCurrent;
        jsonDataDaily = openWeatherDemoForecast;
        jsonDataHourly = openWeatherDemoHourly;

        // Query weather data from the server WeatherApi
        var response = await http.get(Uri.parse(apiURLWeatherApi(lat, lon)));
        var jsonstring = response.body;
        print('JSON WeatherApi : $jsonstring');
        jsonDataWeatherApi = jsonDecode(jsonstring);

        break;

      default: // Using the demo data
        // Using weather data from a json in demo file
        jsondataCurrent = openWeatherMapDemoCurrent;
        jsonDataDaily = openWeatherDemoForecast;
        jsonDataHourly = openWeatherDemoHourly;
        jsonDataWeatherApi = tokyo;
    }

    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsondataCurrent),
        WeatherDataDaily.fromJson(jsonDataDaily),
        WeatherDataHourly.fromJson(jsonDataHourly));

    weatherDataV2 = WeatherDataV2(Weatherapi.fromJson(jsonDataWeatherApi));

    return Tuple2(weatherData, weatherDataV2);
  }
}
