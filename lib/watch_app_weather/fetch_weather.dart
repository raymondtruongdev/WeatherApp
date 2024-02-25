import 'dart:convert';
import 'package:weather_app/demo_weather_data.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'weather_api.dart';
import 'weather_data_v2.dart';
import 'package:weather_app/logger_custom.dart';

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

    // Example to make a request new wether data from Openweathermap
    // Just for testing demo, currently we use data from WeatherApi:

    // requestOpenweathermapGetSimple(lat, lon);
    // requestOpenweathermapGet(lat, lon);
    // requestOpenweathermapPost(lat, lon);

    return (weatherApiData);
  }
}

// 3 method to request data from server
Future<String> requestOpenweathermapGetSimple(double lat, double lon) async {
  // Using simple GET method to make a request new wether data from Openweathermap
  String apiKey = 'f7f4dcfaa8a0f0ec8890b38964ea64e7';
  String urlString =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

  // Example:
  // urlString = "https://api.openweathermap.org/data/2.5/weather?lat=10.7726017&lon=106.697845&appid=f7f4dcfaa8a0f0ec8890b38964ea64e7&units=metric"
  CustomLogger logger = CustomLogger();
  try {
    var uri = Uri.parse(urlString);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      // Successful response
      logger.debug('GET_Simple Response: ${response.body}');
      return response.body;
    } else {
      // Error occurred
      logger.error('Error: ${response.statusCode}');
      return '';
    }
  } catch (e) {
    logger.error(e.toString());
    return '';
  }
}

Future<String> requestOpenweathermapGet(double lat, double lon) async {
  // Using normal GET method to make a request new wether data from Openweathermap
  CustomLogger logger = CustomLogger();
  String apiKey = 'f7f4dcfaa8a0f0ec8890b38964ea64e7';
  var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather');
  var headers = {'Content-Type': 'application/json'};
  var queryParams = {
    'lat': lat.toString(),
    'lon': lon.toString(),
    'appid': apiKey,
    'units': 'metric'
  };
  var uri = Uri.https(url.authority, url.path, queryParams);
  // Example:
  //  "https://api.openweathermap.org/data/2.5/weather?lat=10.7726017&lon=106.697845&appid=f7f4dcfaa8a0f0ec8890b38964ea64e7&units=metric"

  try {
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      // Successful response
      logger.debug('GET Response: ${response.body}');
      return response.body;
    } else {
      // Error occurred
      logger.error('Error: ${response.statusCode}');
      return '';
    }
  } catch (e) {
    logger.error(e.toString());
    return '';
  }
}

Future<String> requestOpenweathermapPost(double lat, double lon) async {
  // Using normal POST method to make a request new wether data from Openweathermap
  CustomLogger logger = CustomLogger();
  String apiKey = 'f7f4dcfaa8a0f0ec8890b38964ea64e7';
  var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather');
  var headers = {'Content-Type': 'application/json'};
  // Create your request body
  var requestBody = {
    'lat': lat.toString(),
    'lon': lon.toString(),
    'appid': apiKey,
    'units': 'metric'
  };

  var uri = Uri.https(url.authority, url.path, requestBody);
  // Example:
  //  "https://api.openweathermap.org/data/2.5/weather?lat=10.7726017&lon=106.697845&appid=f7f4dcfaa8a0f0ec8890b38964ea64e7&units=metric"

  try {
    var response = await http.post(uri, headers: headers);

    if (response.statusCode == 200) {
      // Successful response
      logger.debug('POST Response: ${response.body}');
      return response.body;
    } else {
      // Error occurred
      logger.error('Error: ${response.statusCode}');
      return '';
    }
  } catch (e) {
    logger.error(e.toString());
    return '';
  }
}
