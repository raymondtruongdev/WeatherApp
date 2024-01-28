import 'package:weather_app/api/api_key.dart';

String apiURL(var lat, var lon, var dataType) {
  String url;

  switch (dataType) {
    case 'current':
      url =
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
      break;
    case 'forecast':
      url =
          "api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
      break;
    default:
      url = "http://";
  }

  print(url);
  return url;
}

String apiURLWeatherApi(var lat, var lon) {
  String url;

  url =
      "https://api.weatherapi.com/v1/forecast.json?key=$apiKeyWeatherApi&q=$lat,$lon&days=5&aqi=yes&alerts=no";

  print(url);
  return url;
}

// With free account you can only get current data + forecast data for 5 days / 3 hour and
// https://openweathermap.org/current

//Get current weather USA
// https://api.openweathermap.org/data/2.5/weather?lat=37.4219983&lon=-122.084&units=metric&appid=f7f4dcfaa8a0f0ec8890b38964ea64e7
// lat = 37.4219983
// lon = -122.084
// api_key = f7f4dcfaa8a0f0ec8890b38964ea64e7

// Call 5 day / 3 hour forecast data
// How to make an API call
// You can search weather forecast for 5 days with data every 3 hours by geographic coordinates.
//  All weather data can be obtained in JSON and XML formats.
// api.openweathermap.org/data/2.5/forecast?lat=37.4219983&lon=-122.084&units=metric&appid=f7f4dcfaa8a0f0ec8890b38964ea64e7

// Vietnam
// https://api.openweathermap.org/data/2.5/weather?lat=10.7726017&lon=106.697845&appid=f7f4dcfaa8a0f0ec8890b38964ea64e7&units=metric

// ho chi minh - Viet nam:
// lat: 10.7726017
// lon: 106.697845

// Weatherapi.com
// http://api.weatherapi.com/v1/current.json?key=b2edfd0ad2c946308c0100158242701&q=10.7726017,106.697845&aqi=yes
